//
//  GeofenceLocationsTask.swift
//  PM Sub Study
//
//  Created by Travis Allen on 12/12/18.
//  Copyright © 2018 Travis Allen. All rights reserved.
//

import Foundation
import ResearchKit

public var GeofenceLocationsTask: ORKOrderedTask {
    var steps = [ORKStep]()
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Location Collection Task"
    instructionStep.text = "Please enter the address for each of the following locations:"
    steps += [instructionStep]
    
    let homeAddress = ORKQuestionStep(identifier: "homeAddress")
    homeAddress.title = "Please enter your home address"
    homeAddress.answerFormat = ORKLocationAnswerFormat()
    homeAddress.isOptional = false
    steps += [homeAddress]
    
    let workAddress = ORKQuestionStep(identifier: "workAddress")
    workAddress.title = "Please enter your work address"
    workAddress.answerFormat = ORKLocationAnswerFormat()
    workAddress.isOptional = false
    steps += [workAddress]
    
    let hospitalAddress = ORKQuestionStep(identifier: "hospitalAddress")
    hospitalAddress.title = "Please enter address of your primary hospital outside of Weill Cornell"
    hospitalAddress.answerFormat = ORKLocationAnswerFormat()
    hospitalAddress.isOptional = false
    
    steps += [hospitalAddress]
    
    return ORKOrderedTask(identifier: "GeofenceLocationsTask", steps: steps)
}
