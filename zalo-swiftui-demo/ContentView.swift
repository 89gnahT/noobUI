//
//  ContentView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/15/20.
//

import SwiftUI

struct ContentView: View {
    @State private var offset: CGFloat = 0
    @State private var width: CGFloat = 0
    var body: some View {
        HStack {
            Text("Ngắn")
                .overlay(MoveUnderlineButton(offset: $offset, width: $width))
            Text("Dài ơi là dài")
                .overlay(MoveUnderlineButton(offset: $offset, width: $width))
            Text("vừa vừa")
                .overlay(MoveUnderlineButton(offset: $offset, width: $width))
            Text("x")
                .overlay(MoveUnderlineButton(offset: $offset, width: $width))
        }
        .coordinateSpace(name: "container")
        .padding(.bottom, 5)
        .overlay(underline, alignment: .bottomLeading)
        .animation(.spring())
    }
    var underline: some View {
        Rectangle()
            .frame(height: 2)
            .frame(width: width)
            .padding(.leading, offset)
            .foregroundColor(.red)
    }
    struct MoveUnderlineButton: View {
        var isActive: Bool =  true

        @Binding var offset: CGFloat
        @Binding var width: CGFloat
        var body: some View {
            GeometryReader { geometry in
                Button(action: {
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
