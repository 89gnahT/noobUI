//
//  Session.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/29/20.
//

import Foundation

struct Token: Codable, Equatable {
    let token: String
    let tokenType: String
    
    func getToken() -> String {
        return "\(tokenType) \(token)"
    }
}

struct Session: Codable, Equatable {
    private(set) var token: Token
    private(set) var id: UUID

}
