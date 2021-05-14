//
//  DetailMaCkViewController.swift
//  Demo
//
//  Created by Voi Còi on 2021-05-10.
//  Copyright © 2021 demo. All rights reserved.
//

import UIKit
import SocketIO
import Alamofire

class DetailMaCkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private weak var buyTableView: UITableView!
    @IBOutlet private weak var sellTableView: UITableView!
    
    private var listBuy: [buySellModel] = []
    private var listSell: [buySellModel] = []
    private var maCk = ""
    private let kNumberOfRows = 10
    
    let manager = SocketManager(socketURL: URL(string: "https://datafeed.vps.com.vn/getps10pricesnapshot/VN30F2105,S")!, config: [.log(true), .compress])
    var socket : SocketIOClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView(buyTableView)
        configView(sellTableView)
        socket = manager.defaultSocket
        connectSocket()
//        NotificationCenter.default.addObserver(self, selector: #selector(self.updatePrice(_:)), name: Notification.Name("stockps10price"), object: nil)
//        NotificationCenter.default.addObserver(forName: Notification.Name("stockps10price"), object: nil, queue: nil, using: updatePrice)
    }
    
    private func configView(_ table: UITableView) {
        let nibHeader = UINib(nibName: "\(buySellHeaderCell.self)", bundle: nil)
        table.register(nibHeader, forCellReuseIdentifier: "buySellHeaderCell")
        let nib = UINib(nibName: "\(BuySellTableViewCell.self)", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "BuySellTableViewCell")
    }
    
    func getMaCk(_ maCK: String) {
        maCk = maCK
    }
    
    private func connectSocket() {

        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }

        socket.on("stockps10price") {data, ack in
            guard let message = data as? [buySellModel] else { return }
            print(message)
        }

        socket.connect()
    }
    
    @objc private func updatePrice(_ notification: Notification) {
        weak var wSelf = self
        DispatchQueue.main.async {
            guard let mSelf = wSelf else { return }
            mSelf.buyTableView.reloadData()
            mSelf.sellTableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kNumberOfRows
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableCell(withIdentifier: "buySellHeaderCell") as? buySellHeaderCell {
            return header
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BuySellTableViewCell", for: indexPath) as? BuySellTableViewCell {
            return cell
        }
        return UITableViewCell()
    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
}
