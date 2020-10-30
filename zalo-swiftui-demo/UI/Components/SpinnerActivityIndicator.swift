//
//  SpinnerActivityIndicator.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/29/20.
//

import SwiftUI

struct SpinnerActivityIndicator: View {
    let style = StrokeStyle(lineWidth: 6, lineCap: .round)
    @State var animate: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(
                    AngularGradient(gradient: .init(colors: [.lg300, .lg500]), center: .center),
                    style: style)
                .rotationEffect(Angle(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
        }
        .onAppear() {
            self.animate.toggle()
        }
        .frame(maxHeight: 100)
    }
    
    
}
