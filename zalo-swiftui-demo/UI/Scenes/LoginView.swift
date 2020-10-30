//
//  LoginView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/16/20.
//

import SwiftUI

struct LoginView: View {
    
//    @EnvironmentObject var navigator: RootNavigator
    
    @State var status: LoginRequestStatus = .inactive
    @State var errorCode: LoginErrorCode = .successful
    @State var showProgressView: Bool = false
        
    @ObservedObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Bạn có thể đăng nhập bằng số điện thoại hoặc username")
                        .font(.custom("SFProDisplay-Normal", size: 14))
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(maxWidth: 414)
                    Spacer()
                }
                .background(Color.lg700)
                
                
                VStack {
                    HStack {
                        TextField(self.loginViewModel.idPlaceholderText, text: self.$loginViewModel.idText)
                            .autocapitalization(UITextAutocapitalizationType.none)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    HStack {
                        SecureField(self.loginViewModel.passwordPlaceholderText, text: self.$loginViewModel.passwordText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                }
                .padding()
                
                if (self.status != .inactive || self.status != .pending) {

                    HStack{
                        Group {
                            if self.status == .networkError {
                                Text("Có lỗi xảy ra với đường truyền mạng, vui lòng thử lại")
                            } else {
                                Text(self.errorCode.errorDescription)
                                    .foregroundColor(.rl300)
                            }
                        }
                        .foregroundColor(.rl300)
                                    .padding()
                        Spacer()
                    }
                }
                
                HStack {
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Lấy lại mật khẩu")
                            .foregroundColor(.bl300)
                            .padding()
                    }
                    Spacer()
                }
                
                Button(action: {
                    UIApplication.shared.endEditing()
                    self.loginViewModel.requestLogin()
                    //                if self.validInput() {
                    //                    self.navigator.authEventPublisher.send(.sessionDidLogin)
                    //                }
                }) {
                    Text("Đăng nhập")
                }
                .disabled(self.status == .pending)
                .frame(width: .adaptiveButtonWidth, alignment: .center)
                .buttonStyle(ZAButtonStyle(type: .primary, layout: .large, hasFixedWidth: true))
                .disabled(!self.loginViewModel.loginButtonIsEnabled)
                .padding()
                
                Spacer()
                
                NavigationLink(destination: FAQView()) {
                    Text("Câu hỏi thường gặp")
                        .foregroundColor(.bl300)
                        .padding()
                }
                
            }
            
            if self.showProgressView {
                SpinnerActivityIndicator()
            }
        }
        .navigationBarTitle("Đăng nhập", displayMode: .inline)
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .onReceive(self.loginViewModel.$loginRequestStatus) { status in
            self.status = status
            switch (status) {
            case .finish(code: let code):
                self.showProgressView = false
                self.errorCode = code
            case .pending:
                self.errorCode = .successful
                self.showProgressView = true
            case .inactive:
                self.errorCode = .successful
                self.showProgressView = false
            case .networkError:
                self.showProgressView = false
            }
            
        }
        //        .onAppear {
        //            self.hideNavBar = false
        //            UIApplication.setStatusBarStyle(.lightContent)
        //        }
        
    }
}



