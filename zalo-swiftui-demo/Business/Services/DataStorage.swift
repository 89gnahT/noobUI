//
//  DataStorage.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/26/20.
//

import Foundation

protocol DataStorage {
    
    func get<T>(key: String, type: T.Type) -> T? where T : Codable
    
    func get(key: String) -> String?
    
    func set<T>(key: String, value: T?) where T : Codable
    
    func remove(key: String)
    
    func clear()
}
