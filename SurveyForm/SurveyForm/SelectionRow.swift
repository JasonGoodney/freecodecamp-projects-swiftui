//
//  MultipleSelectionRow.swift
//  SurveyForm
//
//  Created by Jason Goodney on 7/13/20.
//

import SwiftUI

struct SelectionRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Text(title)
                    .foregroundColor(.black)
                
                if isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        })
    }
}

struct SelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        SelectionRow(title: "Test", isSelected: true) {
            
        }
    }
}
