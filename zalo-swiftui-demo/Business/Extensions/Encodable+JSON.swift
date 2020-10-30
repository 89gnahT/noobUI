//
//  Encodable+JSON.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/26/20.
//

import Foundation

extension Encodable {
    func toJSON() -> Data? {
        return try? JSON.encoder.encode(self)
    }
}
