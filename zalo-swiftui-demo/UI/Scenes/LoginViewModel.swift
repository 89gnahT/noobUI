//
//  LoginViewModel.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/19/20.
//

import Foundation
import Combine

enum LoginRequestStatus: Equatable {
    
    case inactive, pending
    case finish(code: LoginErrorCode)
//    case success
//    case failure(code: LoginResponseCode)
//    case failure(nwError: NetworkError)
    case networkError
}

class LoginViewModel: ObservableObject {
    
    @Published var idText = ""
    @Published var passwordText = ""
    
    private(set) var idPlaceholderText = "Số điện thoại"
    private(set) var passwordPlaceholderText = "Mật khẩu"
    
    @Published var loginButtonIsEnabled: Bool = false
    @Published var loginRequestStatus: LoginRequestStatus = .inactive
    
    private let authService: Authentication = AuthenticationService.shared
    
    private var cancellableSet = Set<AnyCancellable>()
    
    private lazy var loginActionSubject = PassthroughSubject<Credential, Never>()
    
    init() {
        Publishers
            .CombineLatest(self.$idText, self.$passwordText)
            .map { [weak self] id, password in
                return self?.shouldEnableLoginButton(id, password) == true
            }
            .assign(to: \.loginButtonIsEnabled, on: self)
            .store(in: &self.cancellableSet)
        
        self.$loginRequestStatus
            .filter { $0 == .pending }
            .flatMap(maxPublishers: .max(1)) { _ in
                self.login()
                    .map { (result: Result<LoginErrorCode, NetworkError>) -> LoginRequestStatus in
                        switch (result) {
                        case .success(let code):
                            return .finish(code: code)
                        case .failure(_):
                            return .networkError
                        }
                    }
            }
            .receive(on: DispatchQueue.main)
            .assign(to: \.loginRequestStatus, on: self)
            .store(in: &self.cancellableSet)
        
    }
    
    func requestLogin() {
        self.loginRequestStatus = .pending
    }
    
    private func login() -> AnyPublisher<Result<LoginErrorCode,NetworkError>, Never>  {
        return self.authService.login(Credential(id: self.idText, password: self.passwordText, region: "vi"))
    }
    
    private func shouldEnableLoginButton(_ id: String, _ password: String) -> Bool {
        return id.count * password.count > 0
    }
    
}
