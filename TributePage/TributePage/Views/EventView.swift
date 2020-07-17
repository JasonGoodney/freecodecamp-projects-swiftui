//
//  EventView.swift
//  TributePage
//
//  Created by Jason Goodney on 7/14/20.
//

import SwiftUI

struct EventView: View {
    let event: Event
    
    var body: some View {
        Text("• \(event.year)")
            .bold()
            +
        Text(" - \(event.text)")
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event(year: "1933", text: "Leaves his family's farm to attend the University of Minnesota, thanks to a Depression era program known as the \"National Youth Administration\""))
    }
}
