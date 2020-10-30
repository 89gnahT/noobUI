//
//  JSON.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/26/20.
//

import Foundation

enum JSON {
    static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    static let decoder = JSONDecoder()
}
