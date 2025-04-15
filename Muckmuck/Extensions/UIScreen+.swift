//
//  UIScreen+.swift
//  Muckmuck
//
//  Created by Rama on 4/15/25.
//

import SwiftUI

extension UIScreen {
    static var mainBounds: CGRect {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return windowScene.screen.bounds
    }
}
