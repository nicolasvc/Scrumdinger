//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Morfeo Olympo on 16/03/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
