//
//  TimelineView.swift
//  TributePage
//
//  Created by Jason Goodney on 7/14/20.
//

import SwiftUI
import SFSafeSymbols

struct TimelineView: View {
    let person: Person
    
    @State private var showingTimeline = false
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Here's a timeline of \(person.shortName)'s life:")
                    .font(.headline)
                Image(systemName:
                        withAnimation {
                            self.showingTimeline
                            ? SFSymbol.chevronDown.rawValue
                            : SFSymbol.chevronUp.rawValue
                        }
                        
                )
            }
            
            
            if showingTimeline {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(person.timeline, id: \.self) { event in
                        EventView(event: event)
                    }
                }
            } else {
                Text("Tap to show timeline")
            }
        }
        
        .onTapGesture {
            withAnimation {
                self.showingTimeline.toggle()
            }
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(person: Person.example)
    }
}
