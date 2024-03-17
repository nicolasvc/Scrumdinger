//
//  CardView.swift
//  Scrumdinger
//
//  Created by Morfeo Olympo on 16/03/24.
//

import SwiftUI

struct CardView: View {
    let scrum:DailyScrum
    var body: some View {
        VStack(alignment:.leading){
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(/*@START_MENU_TOKEN@*/.isHeader/*@END_MENU_TOKEN@*/)
            Spacer()
                .frame(height: 16)
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
    }
}

#Preview {
    let scrumData :DailyScrum = DailyScrum.sampleScrum
   
    return CardView(scrum: scrumData)
        .background(scrumData.theme.mainColor)
        .previewLayout(.fixed(width: 400, height: 60))
}
