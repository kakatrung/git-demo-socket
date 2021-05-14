//
//  Commom.swift
//  Demo
//
//  Created by VoiCoi on 11/05/2021.
//  Copyright © 2021 demo. All rights reserved.
//

import Foundation

func round(_ value: Double) -> String {
    let multiplier = pow(10.0, 2.0)
    let rounded = round(value * multiplier) / multiplier
    return String(rounded)
}
