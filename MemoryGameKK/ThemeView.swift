//
//  ThemeView.swift
//  MemoryGameKK
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ThemeView: View {
    let icon: String
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text(title)
                    .font(.caption)
            }
        }
    }
}
