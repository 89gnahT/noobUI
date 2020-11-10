//
//  Request+Additions.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/28/20.
//

import Foundation

extension Request {
    
    static func loginRequest(cred: Credential) -> Request<LoginErrorCode> {
        let url = URL(string: "https://api.zalo.com")!.appendingPathComponent("/api/login")
        let parameters: [String : CustomStringConvertible] =
            ["api_key": "ZaloAPIConstantKey",
             "id": cred.id,
             "password": cred.password,
             "region": cred.region]
        return Request<LoginErrorCode>(url: url, parameters: parameters)
    }
    
    static func logoutRequest(_ user: User) -> Request<LogoutErrorCode> {
        let url = URL(string: "https://api.zalo.com")!.appendingPathComponent("/api/logout")
        let parameters: [String : CustomStringConvertible] =
            ["api_key": "ZaloAPIConstantKey",
             "user": user.id,
             "locationTime": "LogoutLocationTime"]
        return Request<LogoutErrorCode>(url: url, parameters: parameters)
    }
}
