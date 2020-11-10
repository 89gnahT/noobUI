//
//  ZChatView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/6/20.
//

import Foundation
import SwiftUI
import Combine

@available(iOS 14.0, *)
struct ZChatView: View {
    @EnvironmentObject private var user: User

    @StateObject private var model = ChatViewModel()
    @State private var message = ""
    
    // MARK: - Events
    private func onAppear() {
        model.connect(username: user.name, userID: user.id)
    }
    
    private func onDisappear() {
        model.disconnect()
    }
    
    private func onCommit() {
        if !message.isEmpty {
            model.send(text: message)
            message = ""
        }
    }
    
    private func scrollToLastMessage(proxy: ScrollViewProxy) {
        if let lastMessage = model.messages.last {
            withAnimation(.easeOut(duration: 0.4)) {
                proxy.scrollTo(lastMessage.id, anchor: .bottom)
            }
        }
    }

    // MARK: -
    var body: some View {
        VStack {
            // Chat history.
            ScrollView {
                    ScrollViewReader{ proxy in
                        LazyVStack(spacing: 8) {
                            ForEach(model.messages) { message in
                                ChatCellView(message: message, isUser: message.userID == user.id)
                                    .id(message.id)
                            }
                        }
                        .padding(10)
                        .onChange(of: model.messages.count) { _ in
                            scrollToLastMessage(proxy: proxy)
                        }
                    }
                    // Fallback on earlier versions
            }

            // Message field.
            HStack {
                TextField("Message", text: $message, onEditingChanged: { _ in }, onCommit: onCommit)
                    .padding(10)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(5)
                
                Button(action: onCommit) {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size: 20))
                        .padding(6)
                }
                .cornerRadius(5)
                .disabled(message.isEmpty)
                .hoverEffect(.highlight)
            }
            .padding()
        }
        .navigationTitle("Chat")
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
}

