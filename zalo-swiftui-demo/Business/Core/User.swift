//
//  User.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/28/20.
//

import Foundation

class User: ObservableObject {
    
    static let currentUser: User = User()
    
    var id = UUID()
    var name = "Thang Nguyen"
        
    var accountDataStorage: AccountDataStorage = AccountDataStorage.shared
    
    @Published var session: Session?
    
    private init() {
        self.loadSession()
    }
    
    private func loadSession() {
        self.session = self.accountDataStorage.get(key: "session", type: Session.self)
    }
}
