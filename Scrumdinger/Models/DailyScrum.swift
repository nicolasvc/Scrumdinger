//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Morfeo Olympo on 16/03/24.
//

import Foundation

struct DailyScrum : Identifiable{
    let id:UUID
    var title:String
    var attendees:[Attendee]
    var lengthInMinutes:Int
    var lengthInMinutesAsDouble:Double{
        get{
            Double(lengthInMinutes)
        }
        set{
            lengthInMinutes = Int(newValue)
        }
    }
    var theme:Theme
    
    init(id: UUID = UUID(), title: String, attendees: [Attendee], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum{
    static let sampleData:[DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: [Attendee(name: "Zeus"),Attendee(name: "Perseo")], lengthInMinutes: 10, theme: .yellow2),
        DailyScrum(title: "App dev", attendees: [Attendee(name: "Zeus"),Attendee(name: "Karonte")], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web dev", attendees: [Attendee(name: "Zeus"),Attendee(name: "Cronos")], lengthInMinutes: 5, theme: .poppy)
    ]
    static let sampleScrum:DailyScrum = DailyScrum(title: "Destroy the world", attendees: [Attendee(name: "Zeus"),Attendee(name: "Kratos")], lengthInMinutes: 100, theme: .yellow2)
}

extension DailyScrum{
    
    struct Attendee:Identifiable{
        let id:UUID
        var name:String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
        
    }
    
    static var emptyScrum:DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .yellow2)
    }
    
    
}

