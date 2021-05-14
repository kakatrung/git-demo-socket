//
//  SocketIOManager.swift
//  Demo
//
//  Created by VoiCoi on 12/05/2021.
//  Copyright © 2021 demo. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import SocketIO
import ObjectMapper

class SocketIOManager: NSObject {

    static let shared = SocketIOManager()
    private var manager: SocketManager?
    var socket: SocketIOClient?
    var maCk = ""
    var typeCk = ""

    override init() {
        super.init()

        guard let URL = URL(string: Host.baseUrl) else {return}
        manager = SocketManager(socketURL: URL , config: [.log(true), .connectParams(["" : maCk, "" : typeCk])])
        socket = manager?.socket(forNamespace: "/REALTIME_PS_MOBILE")

    }

    //Server Methods

}
