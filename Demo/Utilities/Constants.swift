//
//  Constants.swift
//  Demo
//
//  Created by Voi Còi on 2021-05-11.
//  Copyright © 2021 demo. All rights reserved.
//

import Foundation

struct Host {
    static let baseUrl = "https://datafeed.vps.com.vn/"
}

enum api: String {
    case listMaCk   = "pslistdata"
    case listDetail = "getpsalldatalsnapshot/VN30F2105,VN30F2106,VN30F2109,VN30F2112"
}


