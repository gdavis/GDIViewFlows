//
//  BaseFlow.swift
//  GDIViewFlows
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation

open class BaseFlow: BaseFlowStep, Flow {

    public lazy var steps: [FlowStep] = {
        return [initialStep]
    }()
    
    public var currentStep: FlowStep?
    public var stepIndex: Int = 0

    open var initialStep: FlowStep {
        assertionFailure("Subclasses must return a custom initial step.")
        
        return BaseFlowStep(navigationController: navigationController, delegate: nil)
    }

    open override var viewController: UIViewController {
        return currentStep?.viewController ?? UIViewController()
    }

    open override func start() {
        nextStep()
    }

    open func appendAndStart(step: FlowStep) {
        steps.append(step)

        nextStep()
    }
}
