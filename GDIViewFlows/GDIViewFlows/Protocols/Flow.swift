//
//  Flow.swift
//  GDIViewFlows
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation

public protocol Flow: FlowStep {
    var steps: [FlowStep] { get }
    var initialStep: FlowStep { get }
    var currentStep: FlowStep? { get }
}
