//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Morfeo Olympo on 16/03/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum:DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingdEditView = false
    
    var body: some View {
        List{
            Section(header: Text("Meeting info")){
                NavigationLink(destination:MeetingView()){
                    Label("Start meetings",systemImage: "timer")
                        .font(.headline)
                }.foregroundColor(.accentColor)
                HStack{
                    Label("Lenght",systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack{
                    Label("Theme",systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            Section(header:Text("Attendees")){
                ForEach(scrum.attendees){ attende in
                    Label(attende.name,systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit"){
                editingScrum = scrum
                isPresentingdEditView = true
            }
        }
        .sheet(isPresented:$isPresentingdEditView){
            NavigationStack{
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                isPresentingdEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done"){
                                isPresentingdEditView = false
                                scrum = editingScrum
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    return DetailView(scrum: .constant(DailyScrum.sampleScrum))
}
