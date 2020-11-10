//
//  MainView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/3/20.
//

import SwiftUI
import UIKit

struct MainView: UIViewControllerRepresentable {
    
    @EnvironmentObject var authService: AuthenticationService
    
    var currentTab: Int = 0
    
    func makeUIViewController(context: Context) -> SplitViewController {
        //        let vc = UIViewController()
        //        vc.view.backgroundColor = .red
        //        let nav = UINavigationController(rootViewController: vc)
        //        let main = SplitViewController(masterViewController: nav)
        return self.mainView()
    }
    
    func updateUIViewController(_ uiViewController: SplitViewController, context: Context) {
        
    }
    
    func mainView() -> SplitViewController {
        
        let message = UINavigationController(rootViewController: UIHostingController(rootView: MessageView()))
        message.tabBarItem = UITabBarItem(title: "Tin nhắn", image: UIImage(named: "icn_tabbar_contact_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icn_tabbar_message_selected")?.withRenderingMode(.alwaysOriginal))
        let contact = UINavigationController(rootViewController: UIHostingController(rootView: ContactView()))
        contact.tabBarItem = UITabBarItem(title: "Danh bạ", image: UIImage(named: "icn_tabbar_message_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icn_tabbar_message_selected")?.withRenderingMode(.alwaysOriginal))
        let group = UINavigationController(rootViewController: UIHostingController(rootView: GroupView()))
        group.tabBarItem = UITabBarItem(title: "Nhóm", image: UIImage(named: "icn_tabbar_message_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icn_tabbar_message_selected")?.withRenderingMode(.alwaysOriginal))
        let social = UINavigationController(rootViewController: UIHostingController(rootView: SocialView()))
        social.tabBarItem = UITabBarItem(title: "Nhật ký", image: UIImage(named: "icn_tabbar_message_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icn_tabbar_message_selected")?.withRenderingMode(.alwaysOriginal))
        let more = UINavigationController(rootViewController:
                                            UIHostingController(rootView: MoreView()
                                                                    .environmentObject(self.authService)))
        //        let more = UINavigationController(rootViewController: UIHostingController(rootView: MoreView()))
        more.tabBarItem = UITabBarItem(title: "Thêm", image: UIImage(named: "icn_tabbar_message_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icn_tabbar_message_selected")?.withRenderingMode(.alwaysOriginal))
        let tab = UITabBarController()
        tab.viewControllers = [message, contact, group, social, more]
        
        return SplitViewController(masterViewController: tab)
    }
}
