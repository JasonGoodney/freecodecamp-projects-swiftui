//
//  UserInput.swift
//  SurveyForm
//
//  Created by Jason Goodney on 7/13/20.
//

import Foundation

class UserInput: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var age = ""
    @Published var recommendation = Recommendation.maybe
    @Published var currentRole = CurrentRole.student
    @Published var commentOrSuggestion = ""
    @Published var selectedAreasOfImprovement = [String]()
}
