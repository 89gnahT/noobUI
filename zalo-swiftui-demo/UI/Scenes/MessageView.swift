//
//  MessageView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/15/20.
//

import SwiftUI

struct MessageView: View {
    
    @ObservedObject var messageViewModel = MessageViewModel()
    
//    @EnvironmentObject var presentationData: MainViewPresentationData
    
    var body: some View {
        Group {
            if messageViewModel.messages.isEmpty {
                Text("Loading")
                    .onAppear {
                        self.messageViewModel.fetch()
                    }
            } else {
                List(messageViewModel.messages) { message in
                    MessageCellView(model: message)
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
        }
        .onAppear {
//            self.presentationData.hideTabNavigation = false
//            self.presentationData.tabNavigationTitle = "Messages"
//            self.presentationData.tabNavigationBarTrailingItems = .init(Image("icnOnboardEdit"))
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
            .environmentObject(MainViewPresentationData())
        //        Text("Hello")
    }
}
