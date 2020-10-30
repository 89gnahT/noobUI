//
//  ZAMainView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/15/20.
//

import SwiftUI

enum Tab {
    case recent
    case contact
    case groupVIew
    case social
    case more
}

struct ZAMainView: View {

    @EnvironmentObject var authService: AuthenticationService
    
    @ObservedObject var model = MainViewPresentationData()
    
    let messageView = MessageView()
    let contactView = ContactView()
    let groupView = GroupView()
    let socialView = SocialView()
    let moreView = MoreView()
    
    var body: some View {
        NavigationView {
            //            if #available(iOS 14, *) {
            
            //            } else {
            TabView(selection: $model.selectedTab) {
                Group {
                    messageView
                        .tabItem { TabViewItem(index: $model.selectedTab, itemView: .message) }
                        .tag(0)
                    contactView
                        .tabItem { TabViewItem(index: $model.selectedTab, itemView: .contact) }
                        .tag(1)
                    groupView
                        .tabItem { TabViewItem(index: $model.selectedTab, itemView: .group) }
                        .tag(2)
                    socialView
                        .tabItem { TabViewItem(index: $model.selectedTab, itemView: .social) }
                        .tag(3)
                    moreView
                        .tabItem { TabViewItem(index: $model.selectedTab, itemView: .more) }
                        .tag(4)
                        .environmentObject(self.authService)
                }
            }
            .padding(.leading, 0.11)
            .navigationBarHidden(model.hideTabNavigation)
//            .navigationBarItems(trailing: model.tabNavigationBarTrailingItems)
            .navigationBarTitle(model.tabNavigationTitle, displayMode: .inline)
            .environmentObject(model)
            //            }
            
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct ZAMainView_Previews: PreviewProvider {
    static var previews: some View {
        ZAMainView()
    }
}

private struct TabViewItem: View {
    @Binding var index: Int
    
    let itemView: ItemView
    
    var body: some View {
        VStack {
            if index == self.itemView.rawValue {
                self.itemView.selectedImage
            } else {
                self.itemView.image
            }
            
            Text(self.itemView.text)
        }
    }
}

extension TabViewItem {
    
    enum ItemView: Int {
        case message
        case contact
        case group
        case social
        case more
        
        var image: Image {
            switch self {
            case .message:
                return Image("icn_tabbar_message_normal")
                    .renderingMode(.original)
            case .contact:
                return Image("icn_tabbar_contact_normal")
                    .renderingMode(.original)
            case .group:
                return Image("icn_tabbar_group_normal")
                    .renderingMode(.original)
            case .social:
                return Image("icn_tabbar_social_normal")
                    .renderingMode(.original)
            case .more:
                return Image("icn_tabbar_more_normal")
                    .renderingMode(.original)
            }
        }
        
        var selectedImage: Image {
            switch self {
            case .message:
                return Image("icn_tabbar_message_selected")
            case .contact:
                return Image("icn_tabbar_contact_selected")
            case .group:
                return Image("icn_tabbar_group_selected")
            case .social:
                return Image("icn_tabbar_social_selected")
            case .more:
                return Image("icn_tabbar_more_selected")
            }
        }
        
        var text: String {
            switch self {
            case .message:
                return "Tin nhắn"
            case .contact:
                return "Danh bạ"
            case .group:
                return "Nhóm"
            case .social:
                return "Nhật ký"
            case .more:
                return "Thêm"
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ZAMainView()
    }
}
