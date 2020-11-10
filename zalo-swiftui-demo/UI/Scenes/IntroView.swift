//
//  IntroView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/16/20.
//

import SwiftUI

struct IntroView: View {
    
    //    @EnvironmentObject var navigator: RootNavigator
    
    @State var selection: Int? = nil
    
    @ObservedObject var introViewModel = IntroViewModel()
    
    @State private var initialIntroItemIndex = 0
    
    //    @State private var hideNavBar: Bool = false
    //    @State private var offset: CGFloat = 0
    //    @State private var width: CGFloat = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .renderingMode(.original)
                    .padding(.top)
                    .frame(alignment: .top)
                    .opacity(self.initialIntroItemIndex == 4 ? 0 : 1)
                VStack {
                    ZStack(alignment: .top) {
                        VStack {
                            Image("background_city")
                                .resizable()
                                .renderingMode(.original)
                                .scaledToFit()
                                .frame(maxWidth: .adaptiveContentWidth, alignment: .top)
                            Spacer()
                        }

                        Group {
                            if #available(iOS 14.0, *) {
                                TabView(selection: $initialIntroItemIndex) {
                                    ForEach(0..<self.introViewModel.introContents.count) { i in
                                        IntroItemView(content: self.introViewModel.introContents[i])
                                            .tag(i)
                                    }
                                }
                                .tabViewStyle(PageTabViewStyle())
                                .onAppear {
                                    UIPageControl.appearance().currentPageIndicatorTintColor = .bl400
                                    UIPageControl.appearance().pageIndicatorTintColor = .lg300
                                }
                            } else {
                                PageView(self.introViewModel.introContents.map {
                                    IntroItemView(content: $0)
                                })
                            }
                        }
                        .frame(maxWidth: .adaptiveContentWidth ,maxHeight: 400, alignment: .top)
                    }
                }
                
                Spacer()
                VStack {
                    NavigationLink(destination:
                                    LoginView()
                                   /*.environmentObject(self.navigator)*/,
                                   tag: 1, selection: self.$selection) {
                    }
                    
                    Button("Đăng nhập") {
                        self.selection = 1
                    }
                    .buttonStyle(ZAButtonStyle(type: .primary, layout: .large, hasFixedWidth: true))
                    .frame(width: .adaptiveButtonWidth, alignment: .center)
                    .padding(.vertical)
                    
                    
                    
                    NavigationLink(destination:
                                    RegisterView()
                                   /*.environmentObject(self.navigator)*/,
                                   tag: 2, selection: self.$selection) {

                    }
                    
                    Button("Đăng ký") {
                        self.selection = 2
                    }
                    .frame(width: .adaptiveButtonWidth, alignment: .center)
                    .buttonStyle(ZAButtonStyle(type: .general, layout: .large, hasFixedWidth: true))
                }
                .padding(.bottom)
                
                
                //                HStack(spacing: 40) {
                //                    Group {
                //                        Text("Tiếng Việt")
                //                            .overlay(UnderlineButton(buttonAction: {
                //                                self.introViewModel.changeLanguage("vi")
                //                            }, offset: self.$offset, width: self.$width))
                //                        Text("English")
                //                            .overlay(UnderlineButton(buttonAction: {
                //                                self.introViewModel.changeLanguage("en")
                //                            }, offset: self.$offset, width: self.$width))
                //                    }
                //                    .font(.custom("SFProDisplay-Regular", size: 14))
                //                }
                //                .coordinateSpace(name: "container")
                //                .padding(.bottom, 10)
                //                .overlay(
                //                    Rectangle()
                //                        .frame(height: 2)
                //                        .frame(width: self.width)
                //                        .padding(.leading, self.offset),
                //                    alignment: .bottomLeading)
                //                .animation(.spring())
                //                .padding(.top)
            }
            .frame(maxHeight: 896, alignment: .top)
            .padding(.bottom, 5)
            //            .navigationBarHidden(self.hideNavBar)
            //            .onAppear {
            //                self.hideNavBar = true
            //                UIApplication.setStatusBarStyle(.lightContent)
            //            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    struct UnderlineButton: View {
        var isActive: Bool =  true
        
        var buttonAction: () -> Void
        
        @Binding var offset: CGFloat
        @Binding var width: CGFloat
        var body: some View {
            GeometryReader { geometry in
                Button(action: {
                    
                    self.buttonAction()
                    self.offset = geometry.frame(in: .named("container")).minX
                    self.width = geometry.size.width
                    
                }) {
                    Rectangle().foregroundColor(.clear)
                }
                .onAppear {
                    if self.isActive {
                        self.width = geometry.size.width
                    }
                }
            }
        }
    }
    
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
        //        Text("IntroView")
        
    }
}
