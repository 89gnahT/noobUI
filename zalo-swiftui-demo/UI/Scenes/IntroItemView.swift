//
//  IntroItemView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/16/20.
//

import SwiftUI

struct IntroContent: Identifiable {
    
    var id = UUID()
    var imageName: String
    var title: String
    var subtitle: String
}


struct IntroItemView: View {
    
    var content: IntroContent
    
    var body: some View {
        VStack {
            Image(content.imageName)
                .renderingMode(.original)
                .padding(.bottom)
            Text(content.title)
                .font(.custom("SFProDisplay-Medium", size: 16))
                .foregroundColor(.black)
                .padding(.top)
            Text(content.subtitle)
                .font(.custom("SFProDisplay-Regular", size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.clear)
        .clipped()
    }
}

struct IntroItemView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Ahihi")
    }
}
