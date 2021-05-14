//
//  LandscapePsViewController.swift
//  Demo
//
//  Created by VoiCoi on 13/05/2021.
//  Copyright © 2021 demo. All rights reserved.
//

import UIKit

class LandscapePsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }

}
