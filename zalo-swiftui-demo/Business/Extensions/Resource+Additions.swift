//
//  Resource+Additions.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/28/20.
//

import Foundation

extension Resource {
    
    static func login(cred: Credential) -> Resource<LoginErrorCode> {
        let url = URL(string: "https://api.zalo.com")!.appendingPathComponent("/api/login")
        let parameters: [String : CustomStringConvertible] =
            ["api_key": "ZaloAPIConstantKey",
             "id": cred.id,
             "password": cred.password,
             "region": cred.region]
        return Resource<LoginErrorCode>(url: url, parameters: parameters)
    }
    
    static func logout() -> Resource<LogoutErrorCode> {
        let url = URL(string: "https://api.zalo.com")!.appendingPathComponent("/api/logout")
        let parameters: [String : CustomStringConvertible] =
            ["api_key": "ZaloAPIConstantKey",
             "locationTime": "LogoutLocationTime"]
        return Resource<LogoutErrorCode>(url: url, parameters: parameters)
    }
}
