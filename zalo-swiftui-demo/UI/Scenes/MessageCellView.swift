//
//  MessageCellView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/15/20.
//

import SwiftUI

struct MessageCellView: View {
    let model: Message
    
    var body: some View {
        if #available(iOS 14.0, *) {
            VStack(spacing: 0) {
                HStack(spacing: 14) {
                    //                Image(model.)
                    Circle()
                        //                    .renderingMode(.original)
                        //                    .resizable()
                        .frame(width: 48, height: 48)
                        .accentColor(.red)
                    //                    .cornerRadius(24)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(alignment: .top) {
                            Text(model.name)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.primary)
                            Spacer()
                            Text("4:20")
                                .font(.system(size: 10))
                                .foregroundColor(.secondary)
                        }
                        
                        Text(model.body)
                            .lineLimit(1)
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                
                Divider()
                    .overlay(Color.gray)
                    .padding(.zero)
            }
            .background(
                NavigationLink(destination: ZChatView()
                                .environmentObject(User.currentUser)){
                    //            NavigationLink(destination: ChatView()){
                    EmptyView()
                }
                .frame(width: 0, height: 0)
                .opacity(0)
            )
        } else {
            // Fallback on earlier versions
        }
    }
}

struct MessageCellView_Previews: PreviewProvider {
    static var previews: some View {
//        MessageCellView(model: Message(title: "jfdnsbhjkfbksdfbsdk", url: "ahahaha"))
        Text("hello")
    }
}
