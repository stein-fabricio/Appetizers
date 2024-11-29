//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Fabricio Stein on 29/11/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
