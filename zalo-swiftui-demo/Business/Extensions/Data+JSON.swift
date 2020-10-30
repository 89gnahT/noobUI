//
//  Data+JSON.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/26/20.
//

import Foundation

extension Data {
    func toObject<T:Codable>(_ type: T.Type) -> T? {
//        if type == VoidResponse.self {
//            return VoidResponse() as? T
//        }
        return try? JSON.decoder.decode(type, from: self)
    }
}
