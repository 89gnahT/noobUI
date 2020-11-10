//
//  NetworkService.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/26/20.
//

import Foundation
import Combine

class NetworkService: Network {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: URLSessionConfiguration.ephemeral)) {
        self.session = session
    }
    
    @discardableResult
    func request<T>(_ resource: Request<T>) -> AnyPublisher<Result<T, NetworkError>, Never> {
        guard let request = resource.request else {
            return Just(.failure(.invalidRequest))
                .catch{ _ in
                    Empty().eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError { _ in
                NetworkError.invalidRequest
            }
            .print()
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: NetworkError.invalidResponse)
                        .eraseToAnyPublisher()
                }
                
                guard 200..<300 ~= response.statusCode else {
                    return Fail(error: NetworkError.dataError(statusCode: response.statusCode, data: data))
                        .eraseToAnyPublisher()
//                    return Fail(error: NetworkError.invalidResponse)
//                        .eraseToAnyPublisher()
                }
                return Just(data)
                    .catch { _ in
                        Empty().eraseToAnyPublisher()
                    }
//                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
                
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .map { .success($0) }
            .catch ({ error -> AnyPublisher<Result<T, NetworkError>, Never> in
                print(error.localizedDescription)
                return Just(.failure(NetworkError.JSONDecodingError(error: error)))
//                return Just(.failure(NetworkError.invalidResponse))
                    .catch { _ in
                        Empty().eraseToAnyPublisher()
                    }
                    .eraseToAnyPublisher()
                
            })
            .eraseToAnyPublisher()
    }
    
}
