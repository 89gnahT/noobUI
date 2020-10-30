//
//  AccountDataStorage.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/26/20.
//

import Foundation

class AccountDataStorage: DataStorage {
    
    static let shared: AccountDataStorage = AccountDataStorage()
    
    private var data: [String:String]
    
    private init() {
        self.data = UserDefaults.standard
            .data(forKey: "userData")?
            .toObject([String:String].self) ?? [:]
        
        print("Loaded user data: \(self.data.count) keys")
    }
    
    func get<T>(key: String, type: T.Type) -> T? where T : Codable {
        let result = self.data[key]?.data(using: .utf8)?.toObject(type)
        return result
    }
    
    func get(key: String) -> String? {
        return self.data[key]
    }
    
    func set<T>(key: String, value: T?) where T : Codable {
        if let json = value?.toJSON() {
            self.data[key] = String(data: json, encoding: .utf8)
            self.synchronize()
        }
    }
    
    func remove(key: String) {
        self.data.removeValue(forKey: key)
        self.synchronize()
    }
    
    func clear() {
        self.data.removeAll()
        self.synchronize()
    }
    
    private func synchronize() {
        UserDefaults.standard.set(self.data.toJSON(), forKey: "userData")
    }
}
