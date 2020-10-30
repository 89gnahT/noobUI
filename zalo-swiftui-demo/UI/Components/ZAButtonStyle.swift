//
//  ZAButtonStyle.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/16/20.
//

import SwiftUI

enum ButtonLayout {
    case large
    case medium
    case custom(height: CGFloat, padding: EdgeInsets, cornerRadius: CGFloat)
    
    var padding: EdgeInsets {
        switch self {
        case .large:
            return .init(top: 12, leading: 16, bottom: 12, trailing: 16)
        case .medium:
            return .init(top: 4, leading: 12, bottom: 4, trailing: 12)
        case .custom(height: _, padding: let padding, cornerRadius: _):
            return padding
        }
    }
    
    var height: CGFloat {
        switch self {
        case .large:
            return 40
        case .medium:
            return 24
        case .custom(height: let height, padding: _, cornerRadius: _):
            return height
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .medium, .large:
            return 4
        case .custom(height: _, padding: _, cornerRadius: let radius):
            return radius
        }
    }
}

enum GradientDirection {
    case horizontal
    case vertical
}

enum ButtonType {
    case primary
    case secondary
    case general
    case red
    
    func textColor(isEnabled: Bool = true) -> Color {
        switch self {
        case .primary:
            return isEnabled ? .w300 : .w500
        case .secondary:
            return isEnabled ? .bl300 : .bl600
        case .general:
            return isEnabled ? .nl300 : .nl600
        case .red:
            return isEnabled ? .rl300 : .rl600
        }
    }
    
    func backgroundColor(isEnabled: Bool = true, isPressed: Bool = false) -> Color {
        switch self {
        case .primary:
            return isEnabled ? (isPressed ? Color.bl200 : Color.bl300) : Color.bl600
        case .secondary:
            return isEnabled ? (isPressed ? Color.bl600 : Color.bl700) : Color.bl700
        case .general:
            return isEnabled ? (isPressed ? Color.lg300 : Color.lg500) : Color.lg500
        case .red:
            return isEnabled ? (isPressed ? Color.rl600 : Color.rl700) : Color.rl700
        }
    }
}

struct ButtonBackground: View {
    var type: ButtonType
    var isEnabled: Bool
    var isPressed: Bool
    var cornerRadius: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: self.cornerRadius, style: .circular)
            .fill(self.type.backgroundColor(isEnabled: self.isEnabled,
                                            isPressed: self.isPressed))
    }
    
}

struct ZAButtonStyle: ButtonStyle {
        
    var type: ButtonType
    var layout: ButtonLayout
    var hasFixedWidth: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        ButtonContent(configuration: configuration,
                      type: self.type,
                      layout: self.layout,
                      hasFixedWidth: self.hasFixedWidth)
    }
    
    
    private struct ButtonContent: View {
        @Environment(\.isEnabled) var isEnabled: Bool
        
        var configuration: ButtonStyle.Configuration
        var type: ButtonType
        var layout: ButtonLayout
        var hasFixedWidth: Bool
        
        var body: some View {
            HStack {
                if !self.hasFixedWidth {
                    self.configuration.label.padding(self.layout.padding)
                } else {
                    Spacer()
                    self.configuration.label.padding(self.layout.padding)
                    Spacer()
                }
            }
            .frame(height: self.self.layout.height)
            .background(ButtonBackground(type: self.type,
                                         isEnabled: self.isEnabled,
                                         isPressed: self.configuration.isPressed,
                                         cornerRadius: self.layout.cornerRadius))
            .foregroundColor(self.type.textColor(isEnabled: self.isEnabled))
            .animation(.easeInOut(duration: 0.1))
        }
        
    }
}

//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .background(isEnabled ? (configuration.isPressed ? Color.bl200 : Color.bl300) : Color.bl600)
//            .foregroundColor(isEnabled ? (configuration.isPressed ? Color.yellow : Color.w300) : Color.w500)
//            .scaleEffect(configuration.isPressed ? CGFloat(self.style.scale) : 1.0)
//            .rotationEffect(.degrees(configuration.isPressed ? self.style.rotationAngle : 0))
//    }
//}
