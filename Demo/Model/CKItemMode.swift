//
//  CKItemMode.swift
//  Demo
//
//  Created by Voi Còi on 2021-05-10.
//  Copyright © 2021 demo. All rights reserved.
//

import UIKit

typealias JSONDictionary = [String: AnyObject]

class CKItemMode {
    let id: Int?
    let sym: String?
    let mc: String?
    let r: Double?
    let lastPrice: Double?
    let lot: Double?
    
    init?(with dictionary: JSONDictionary) {
        self.id = dictionary["id"] as? Int
        self.sym = dictionary["sym"] as? String
        self.mc = dictionary["mc"] as? String
        self.r = dictionary["r"] as? Double
        self.lastPrice = dictionary["lastPrice"] as? Double
        self.lot = dictionary["lot"] as? Double
        
    }
}
