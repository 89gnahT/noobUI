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
            .load(Request<LoginErrorCode>.loginRequest(cred: cred))
            .handleEvents(receiveOutput: { result in
                switch result {
                case .success(let code):
                    if code == .successful {
                        let token = Token(token: "Token", tokenType: "session")
                        let session = Session(token: token, id: self.currentUser.id)
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
            .load(Request<LogoutErrorCode>.logoutRequest(currentUser))
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
}
