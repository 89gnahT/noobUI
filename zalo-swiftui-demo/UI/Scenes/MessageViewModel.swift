//
//  MessageViewModel.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/15/20.
//

import Foundation
import Combine

struct Message: Codable, Identifiable {
    
    let id: Int
    let name: String
    let email: String
    let body: String
    
}

struct Messages: Decodable {
    let items: [Message]
}

final class MessageViewModel: ObservableObject {
    
    private let messService = MessageMock()
    
    @Published var messages: [Message] = []
    
    private var fetchMessageSubject = PassthroughSubject<Void, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchMessageSubject
            .flatMap { [unowned self] in
                messService.loadRecentMessages()
            }
            .compactMap { result -> [Message]? in
                switch result {
                case .success(let messages):
                    return messages
                default:
                    return nil
                }
            }
            .assign(to: \.messages, on: self)
            .store(in: &self.cancellables)
    }
    
    func fetch() {
        self.fetchMessageSubject.send()
    }
    
}
