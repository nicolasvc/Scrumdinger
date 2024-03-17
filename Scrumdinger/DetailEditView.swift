//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Morfeo Olympo on 16/03/24.
//

import SwiftUI

struct DetailEditView: View {
    
    @Binding var scrum:DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form{
            Section(header:Text("Meeting info")){
                TextField("Title",text:$scrum.title)
                HStack{
                    Slider(value: $scrum.lengthInMinutesAsDouble,in: 5...30,step: 1){
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header:Text("Attendees")){
                ForEach(scrum.attendees){ attende in
                    Text(attende.name)
                }
                .onDelete{ indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee",text:$newAttendeeName)
                    Button(action: {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                        
                        
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    })
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    return DetailEditView(scrum: .constant(DailyScrum.sampleScrum))
}
