//
//  MockMessageService.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/30/20.
//

import Foundation
import Combine

class MockMessageService: ObservableObject {
    
}

class MessageMock: ObservableObject {
    
    var networkService = NetworkService()
    
    @Published var messages = [Message]()
    
    private func recentMessages() -> Resource<[Message]> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!
        return Resource<[Message]>(url: url)
    }
    
    func loadRecentMessages() -> AnyPublisher<Result<[Message], Error>, Never> {
        return self.networkService
            .load(self.recentMessages())
            .map({ (result: Result<[Message], NetworkError>) -> Result<[Message], Error> in
                switch result {
                case .success(let messages):
                    return .success(messages)
                case .failure(let error):
                    return .failure(error)
                }
            })
            .subscribe(on: OperationQueue())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
