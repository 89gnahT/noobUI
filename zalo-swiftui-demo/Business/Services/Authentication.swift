//
//  Authentication.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/28/20.
//

import Foundation
import Combine

protocol Authentication {
    
    var currentUser: User {
        get
    }
    
//    func login(_ cred: Credential) -> AnyPublisher<Result<LoginErrorCode, Error>, Never>

//    func logout(clearData: Bool) -> AnyPublisher<Result<LogoutErrorCode, Error>, Never>
    
    func login(_ cred: Credential) -> AnyPublisher<Result<LoginErrorCode, NetworkError>, Never>

    func logout(clearData: Bool) -> AnyPublisher<Result<LogoutErrorCode, NetworkError>, Never>
}
