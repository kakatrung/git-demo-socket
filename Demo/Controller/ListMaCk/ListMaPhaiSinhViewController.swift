//
//  ListMaPhaiSinhViewController.swift
//  Demo
//
//  Created by Voi Còi on 2021-05-10.
//  Copyright © 2021 demo. All rights reserved.
//

import UIKit
import Alamofire

class ListMaPhaiSinhViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var listMaCKTableView: UITableView!
    private var listCKDetail: [CKItemMode] = []
    private var listMaCk: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listMaCKTableView.separatorColor = UIColor.white
        listMaCKTableView.tableFooterView = UIView()
        getListMaCk()
    }
    
    private func getListMaCk() {
        let url = Host.baseUrl + api.listMaCk.rawValue
        weak var wSelf = self
        AF.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                guard let mSelf = wSelf else { return }
                switch response.result{
                case .success(let json):
                    DispatchQueue.main.async {
                        self.listMaCk = json as! [String]
                        print(mSelf.listMaCk as Any)
                        mSelf.getListDetailMaCk()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private func getListDetailMaCk() {
        let url = Host.baseUrl + api.listDetail.rawValue
        weak var wSelf = self
        AF.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                guard let mSelf = wSelf else { return }
                switch response.result{
                case .success(let json):
                    let jsonArray = json as? [JSONDictionary]
                    let posts = jsonArray?.compactMap(CKItemMode.init(with:))
                    DispatchQueue.main.async {
                        mSelf.listCKDetail = posts ?? []
                        mSelf.listMaCKTableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }

    // MARK: - UITableView delegate, datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMaCk.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CKItemCell", for: indexPath) as? MaCKTableViewCell else {
            return UITableViewCell()
        }
        cell.fillData(listCKDetail[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailMaCkVC") as? DetailMaCkViewController {
            viewController.getMaCk(listCKDetail[indexPath.row].sym ?? "")
            present(viewController, animated: true, completion: nil)
        }
    }

}
