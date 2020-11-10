//
//  ZARootView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/15/20.
//

import SwiftUI

struct ZARootView: View {
    
//    @EnvironmentObject var navigator: RootNavigator
    @EnvironmentObject var authService: AuthenticationService
    
    var body: some View {
        Group {
            switch self.authService.authState {
            case .loggedOut:
                IntroView()
//                ZIntroView()
//                    .environmentObject(self.navigator)
            case .loggedIn:
//                ZAMainView()
//                    .environmentObject(self.authService)
                MainView()
                    .edgesIgnoringSafeArea(.all)
                    .environmentObject(self.authService)
            }
        }
//        .onReceive(self.navigator.authEventPublisher, perform: self.handleAuthEvent)
    }
    
//    private func handleAuthEvent(_ event: AuthEvent?) {
//        switch event {
//        case .sessionDidLogin:
//            self.authService.authState = .loggedIn
//        case .sessionDidLogout:
//            self.authService.authState = .loggedOut
//        case .none:
//            self.authService.authState = .loggedOut
//        }
//    }
}

struct ZARootView_Previews: PreviewProvider {
    static var previews: some View {
        ZARootView()
    }
}
