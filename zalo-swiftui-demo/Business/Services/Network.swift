//
//  Network.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/28/20.
//

import Foundation
import Combine

protocol Network: AnyObject {

    @discardableResult
    func request<T: Decodable>(_ resource: Request<T>) -> AnyPublisher<Result<T, NetworkError>, Never>
}

enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case dataError(statusCode: Int, data: Data)
    case JSONDecodingError(error: Error)
}
