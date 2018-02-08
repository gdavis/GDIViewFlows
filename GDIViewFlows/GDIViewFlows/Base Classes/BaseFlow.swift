//
//  BaseFlow.swift
//  GDIViewFlows
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation

open class BaseFlow: BaseFlowStep, Flow, FlowStepDelegate {

    fileprivate (set) open lazy var steps: [FlowStep] = {
        return [initialStep]
    }()
    
    open var currentStep: FlowStep? {
        return steps.last
    }

    open var initialStep: FlowStep {
        assertionFailure("Subclasses must return a custom initial step.")
        
        return BaseFlowStep(navigationController: navigationController, delegate: nil)
    }

    open override var viewController: UIViewController {
        return currentStep?.viewController ?? UIViewController()
    }

    open override func start() {
        nextStep()
        printSteps()
    }

    open func appendAndStart(step: FlowStep) {
        print("Starting new flow step: \(step)")

        steps.append(step)

        nextStep()

        printSteps()
    }

    open func popToPreviousStep() {
        let  _ = steps.popLast()

        if let previousStep = steps.last {
            previousStep.resume()

            navigationController.popToViewController(previousStep.viewController, animated: true)
        } else {
            cancel()
        }

        printSteps()
    }

    fileprivate func printSteps() {
        print("\(self) Flow Steps Changed:")

        for step in steps {
            print("\t\(step)")
        }
    }

    // MARK: - FlowStepDelegate

    open func userNavigated(to destination: NavigationDestination) {
        print("WARNING: this flow is not yet configured to handle the destination: \(destination)")
    }

    open func stepCompleted(_ step: FlowStep) {
        print("WARNING: this flow is not yet configured to complete the step: \(step)")
    }

    open func stepCancelled(_ step: FlowStep) {
        let stepExistsInFlow = steps.contains { (storedStep) -> Bool in
            return step === storedStep
        }

        if stepExistsInFlow {
            popToPreviousStep()
        }
    }
}
