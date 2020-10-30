//
//  IntroViewModel.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/23/20.
//

import Foundation

class IntroViewModel: ObservableObject {
    
    //    @Published var locale
    let introContents: [IntroContent] = {
        var contents = [IntroContent]()
        contents.append(IntroContent(imageName: "slide1_video", title: "Gọi video ổn định", subtitle: "Trò chuyện thật đã với chất lượng video ổn định \nmọi lúc, mọi nơi"))
        contents.append(IntroContent(imageName: "slide2_image", title: "Chat nhóm tiện ích", subtitle: "Nơi cùng nhau trao đổi, giữ liên lạc với gia đình, \nbạn bè, đồng nghiệp..."))
        contents.append(IntroContent(imageName: "slide3_message", title: "Gửi ảnh nhanh chóng", subtitle: "Trao đổi hình ảnh chất lượng cao với bạn vè thật \nnhanh và dễ dàng"))
        contents.append(IntroContent(imageName: "slide4_group", title: "Nhật ký bạn bè", subtitle: "Nơi cập nhật hoạt động mới nhất của những người \nbạn quan tâm"))
        contents.append(IntroContent(imageName: "slide5_zalo", title: "", subtitle: ""))
        return contents
    }()
    
    func changeLanguage(_ language: String) {
        print("Call service to change language to \(language)")
    }
}

