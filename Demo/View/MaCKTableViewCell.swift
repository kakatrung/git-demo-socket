//
//  MaCKTableViewCell.swift
//  Demo
//
//  Created by Voi Còi on 2021-05-10.
//  Copyright © 2021 demo. All rights reserved.
//

import UIKit

class MaCKTableViewCell: UITableViewCell {

    @IBOutlet private weak var maCkLabel: UILabel!
    @IBOutlet private weak var giaLable: UILabel!
    @IBOutlet private weak var changeLabel: UILabel!
    @IBOutlet private weak var tongLabel: UILabel!
    
    private var maCK = ""
    private var gia = ""
    private var change = ""
    private var total = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setText()
    }

    func fillData(_ ckItem: CKItemMode) {
        maCK = ckItem.sym ?? ""
        gia = round(ckItem.lastPrice ?? 0)
        let valueChange = (ckItem.lastPrice ?? 0) - (ckItem.r ?? 0)
        change = round(valueChange)
        total = round(ckItem.lot ?? 0)
        setText()
    }
    
    private func setText() {
        maCkLabel.text = maCK
        giaLable.text = gia
        changeLabel.text = change
        tongLabel.text = total
    }

}
