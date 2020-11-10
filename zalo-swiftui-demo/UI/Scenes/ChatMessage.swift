//
//  ChatMessage.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/6/20.
//

import Foundation

struct SubmittedChatMessage: Encodable {
    let message: String
    let user: String
    let userID: UUID
}

struct ReceivingChatMessage: Decodable, Identifiable {
    let date: Date
    let id: UUID
    let message: String
    let user: String
    let userID: UUID
}
