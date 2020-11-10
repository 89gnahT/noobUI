//
//  DemoNetworkService.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/28/20.
//

import Foundation
import Combine

class DemoNetworkService {
    
    func load(_ cred: Request<LoginErrorCode>) -> AnyPublisher<Result<LoginErrorCode, NetworkError>, Never> {
        Future<Result<LoginErrorCode, NetworkError>, Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                promise(.success(.success(.successful)))
//                promise(.success(.success(LoginErrorCode(rawValue: LoginErrorCode.allCases.randomElement()!.rawValue )!)))
//                promise(.success(.failure(.invalidRequest)))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func load(_ cred: Request<LogoutErrorCode>) -> AnyPublisher<Result<LogoutErrorCode, NetworkError>, Never> {
        Future<Result<LogoutErrorCode, NetworkError>, Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                promise(.success(.success(.successful)))
            }
        }
        .eraseToAnyPublisher()
    }
    
}
