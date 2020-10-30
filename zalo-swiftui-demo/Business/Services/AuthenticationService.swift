//
//  AuthenticationService.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/26/20.
//

import Foundation
import Combine

class AuthenticationService: Authentication, ObservableObject {
    
    var currentUser: User = User.currentUser
    
    static let shared: AuthenticationService = AuthenticationService()
    
//    var networkService: NetworkService = NetworkService()
    var networkService = DemoNetworkService()
    var accountDataStorage: AccountDataStorage = AccountDataStorage.shared
    
    @Published var authState: AuthState = .loggedOut
    
    private var cancellable: Cancellable?
    
    private init() {
        cancellable = currentUser.$session
            .map { $0 == nil ? AuthState.loggedOut : AuthState.loggedIn }
            .assign(to: \.authState, on: self)
    }
    
    
//    func login(_ cred: Credential) -> AnyPublisher<Result<LoginErrorCode, Error>, Never> {
    func login(_ cred: Credential) -> AnyPublisher<Result<LoginErrorCode, NetworkError>, Never> {
        return networkService
            .load(self.loginResource(cred))
//            .map({ result -> Result<LoginErrorCode, NetworkError>  in
//                switch result {
//                case .success(let code):
//                    if code == .successful {
//                        let token = Token(token: "Token", tokenType: "session")
//                        let session = Session(token: token, id: "1998")
//                        self.accountDataStorage.set(key: "session", value: session)
//                        self.authState = .loggedIn
//                    }
//                    return result
//                default:
//                    return result
//                }
//            })
            .handleEvents(receiveOutput: { result in
                switch result {
                case .success(let code):
                    if code == .successful {
                        let token = Token(token: "Token", tokenType: "session")
                        let session = Session(token: token, id: "1998")
                        self.accountDataStorage.set(key: "session", value: session)
                        self.authState = .loggedIn
                    }
                default:
                    break
                }
            })
            .subscribe(on: OperationQueue())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
//    func logout(clearData: Bool) -> AnyPublisher<Result<LogoutErrorCode, Error>, Never> {
    func logout(clearData: Bool) -> AnyPublisher<Result<LogoutErrorCode, NetworkError>, Never> {
        return networkService
            .load(self.logoutResource(currentUser))
//            .map( { result -> Result<LogoutErrorCode, NetworkError> in
//                switch result {
//                case .success(let code):
//                    if code == .successful {
//                        self.accountDataStorage.clear()
//                        if clearData {
//                            //Clear data
//                        }
//                        DispatchQueue.main.async {
//                            self.authState = .loggedOut
//                        }
//                    }
//                    return result
//                default:
//                    return result
//                }
//            })
            .subscribe(on: OperationQueue())
            .handleEvents(receiveOutput: { result in
                switch result {
                case .success(let code):
                    if code == .successful {
                        self.accountDataStorage.clear()
                        if clearData {
                            //Clear data
                        }
                        DispatchQueue.main.async {
                            self.authState = .loggedOut
                        }
                    }
                default:
                    break
                }
            })
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    private func loginResource(_ cred: Credential) -> Resource<LoginErrorCode> {
        let url = URL(string: "https://api.zalo.com")!.appendingPathComponent("/api/login")
        let parameters: [String : CustomStringConvertible] =
            ["api_key": "ZaloAPIConstantKey",
             "id": cred.id,
             "password": cred.password,
             "region": cred.region]
        return Resource<LoginErrorCode>(url: url, parameters: parameters)
    }
    
    private func logoutResource(_ user: User) -> Resource<LogoutErrorCode> {
        let url = URL(string: "https://api.zalo.com")!.appendingPathComponent("/api/logout")
        let parameters: [String : CustomStringConvertible] =
            ["api_key": "ZaloAPIConstantKey",
             "user": user.id,
             "locationTime": "LogoutLocationTime"]
        return Resource<LogoutErrorCode>(url: url, parameters: parameters)
    }
}
