//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Morfeo Olympo on 16/03/24.
//

import SwiftUI

struct ThemeView: View {
    let theme:Theme
    
    var body: some View {
        Text(theme.name)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(4)
            
    }
}

#Preview {
    ThemeView(theme:Theme.orange)
}
