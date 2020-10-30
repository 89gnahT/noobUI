//
//  AuthManager.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/16/20.
//

import Foundation

enum AuthEvent {
    
    case sessionDidLogin
    case sessionDidLogout
}

protocol AuthManagerDelegate {

    func appManager(_ manager: AuthManager?, sessionDidLogin dictionary: [AnyHashable : Any]?)

    func appManager(_ manager: AuthManager?, sessionDidLogout dictionary: [AnyHashable : Any]?)
    
}


class AuthManager {
    
}
