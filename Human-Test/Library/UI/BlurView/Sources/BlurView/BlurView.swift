//
//  BlurView.swift
//
//
//  Created by Mikael Melkonyan on 9/13/24.
//

import SwiftUI

public struct BlurView: UIViewRepresentable {
    public var style: UIBlurEffect.Style
    public init(style: UIBlurEffect.Style = .systemMaterial) {
        self.style = style
    }
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
