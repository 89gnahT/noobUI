//
//  ChatView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/15/20.
//
//
//  ChatView.swift
//  Zalo-SwiftUI
//
//  Created by Thang Nguyen on 10/6/20.
//

import SwiftUI

struct ChatView: View {
//    let messages: [Message] = mockData(name: "messages")
//    let me: Participant = mockData(name: "self")
    
    var body: some View {
//        GeometryReader { proxy in
//            VStack(spacing: 0) {
//                Divider()
//                    .overlay(Color.gray)
//                    .padding(.leading, 76)
//
//                List {
//                    Group {
//                        ForEach(self.messages) { message in
//                            if message.createdAt != nil {
//                                Time(date: message.createdAt!)
//                            }
//
//                            ChatViewCell(
//                                message: message,
//                                isMine: message.participant.identifier == self.me.identifier
//                            )
//                        }
//                    }
//                    .listRowBackground(Color.gray)
//                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
//                }
//
//                Send(proxy: proxy)
//            }
//        }
//        .background(Color.gray)
//        .edgesIgnoringSafeArea(.bottom)
//        .navigationBarTitle("Chat", displayMode: .inline)
        Text("Chat View")
    }
}

#if DEBUG
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { ChatView() }
    }
}
#endif

private struct Time: View {
    let date: Date
    
    var body: some View {
        Text("4:39")
            .foregroundColor(.gray)
            .font(.system(size: 14, weight: .medium))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 4)
    }
}

private struct Send: View {
    let proxy: GeometryProxy
    
    @State var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .overlay(Color.gray)
                .padding(.leading, 76)
            
            VStack {
                HStack(spacing: 12) {
                    Image("icnMoreSmall")
                    
                    TextField("", text: $text)
                        .frame(height: 40)
                        .background(Color.blue)
                        .cornerRadius(4)
                    
                    Image("nextActive")
                    Image("nextActive")
                }
                .frame(height: 56)
                .padding(.horizontal, 12)
                
                Spacer()
            }
            .frame(height: proxy.safeAreaInsets.bottom + 56)
        }
    }
}
