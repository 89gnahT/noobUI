//
//  ZALoginManager.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/19/20.
//

import Foundation

class ZALoginManager {

    static let shared = ZALoginManager()


    private init() {
    }

}

class AuthenService {
    static let shared: AuthenService = AuthenService()
    
    
    private init() {
//        coreStorage = AccountDatabaseQueue.manager
    }
    
//    fileprivate let coreStorage: AccountDatabaseQueue!
    
    fileprivate let zaloAppID = ""
    
    func start(launchOptions:Dictionary<String, Any>?) {
    }
    
    func handleURL(open url: URL, options:Dictionary<String, Any>?) -> Bool{
        if url.absoluteString.hasPrefix("zalo"){
        }
        return false
    }
    
//    func login(email: String, password: String, completion: @escaping (AccountEntity, Error) -> Void) {
//    }
//    
//    func login(completion: @escaping ((_ success: Bool, _ error: Error?) -> Void)) {
//    }
}
