//
//  Theme.swift
//  Scrumdinger
//
//  Created by Morfeo Olympo on 16/03/24.
//

import SwiftUI


enum Theme: String , CaseIterable,Identifiable{
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow2
    
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow2: return .black
        case .indigo, .magenta, .navy, .oxblood,.orange, .purple: return .white
        }
    }
    
    var mainColor: Color{
        return Color(rawValue)
    }
    
    var name:String{
        rawValue.capitalized
    }
    
    var id:String{
        name
    }
}
