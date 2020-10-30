//
//  MoreView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/16/20.
//

import SwiftUI
import Combine

struct MoreView: View {
    
    @EnvironmentObject var authService: AuthenticationService
    
//    private var cancellableSet = Set<AnyCancellable>()
    
    @State var cancellable: Cancellable?
    
    var body: some View {
        
        Button("Đăng xuất") {
//            AccountDataStorage.shared.clear()
//            AuthenticationService.shared.authState = .loggedOut
//            _ = AuthenticationService.shared.logout(clearData: true)
            self.cancellable = self.authService.logout(clearData: true)
                .sink(receiveValue: { (result) in
                    
                })
//                .receive(on: RunLoop.main)
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
