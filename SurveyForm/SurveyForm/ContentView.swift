//
//  ContentView.swift
//  SurveyForm
//
//  Created by Jason Goodney on 7/11/20.
//

import SwiftUI

enum CurrentRole: String, CaseIterable {
    case student = "Student"
    case fillTimeJob = "Full Time Job"
    case fillTimeLearner = "Full Time Learner"
    case preferNotToSay = "Prefer not to say"
    case other = "Other"
}

enum Recommendation: String, CaseIterable {
    case definitely = "Definitely"
    case maybe = "Maybe"
    case notSure = "Not Sure"
}

struct ContentView: View {
    
    @ObservedObject var userInput = UserInput()
    
    @State private var hasCommentOrSuggestion = false
    @State private var selectedCurrentRoleIndex = 0
    @State private var selectedRecommendationIndex = 1
    @State private var showingAlert = false
    
    
    private var invalidForm: Bool {
        return userInput.name.isEmpty || userInput.email.isEmpty ||
             userInput.selectedAreasOfImprovement.isEmpty
    }
    
    private let areasOfImprovement = ["Front-end Projects", "Back-end Projects", "Data Visualization", "Challenges", "Open Source Community", "Gitter help rooms", "Videos", "City Meetups", "Wiki", "Forum", "Additional Courses"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $userInput.name)
                    
                    TextField("Email", text: $userInput.email)
                        .keyboardType(.emailAddress)
                        
                    TextField("Age (optional)", text: $userInput.age)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Which option best describes your current role?")) {
                    Picker("Select current role", selection: $userInput.currentRole) {
                        ForEach(CurrentRole.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                
                Section(header: Text("Would you recommend freeCodeCamp to a friend?")) {
                    Picker("", selection: $userInput.recommendation) {
                        ForEach(Recommendation.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("What would you like to see improved? (Check all that apply)")) {
                    List {
                        ForEach(areasOfImprovement, id: \.self) { area in
                            MultipleSelectionRow(title: area, isSelected: userInput.selectedAreasOfImprovement.contains(area)) {
                                if self.userInput.selectedAreasOfImprovement.contains(area) {
                                    self.userInput.selectedAreasOfImprovement.removeAll(where: { $0 == area })
                                }
                                else {
                                    self.userInput.selectedAreasOfImprovement.append(area)
                                }
                            }
                        }
                    }
                }
                
                
                Section {
                    Toggle("Any comments or suggestions?", isOn: $hasCommentOrSuggestion)
                    
                    if hasCommentOrSuggestion {
                        TextEditor(text: $userInput.commentOrSuggestion)
                            .frame(height: 120)
                    }
                }
            }
            .navigationTitle("Survey Form")
            .navigationBarItems(
                trailing: Button(action: {
                    self.showingAlert = true
                }, label: {
                    Text("Submit")
                })
                .disabled(invalidForm)
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Thank you"), message: Text("\(userInput.name), we appreciate your input."), dismissButton: .default(Text("OK")))
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
