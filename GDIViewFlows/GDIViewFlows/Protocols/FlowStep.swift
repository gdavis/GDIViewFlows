//
//  FlowStep.swift
//  GDIViewFlows
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation

public protocol NavigationDestination {
}

public enum FlowStepState {
    case unstarted
    case started
    case awaitingDependencies
    case finished
    case cancelled
}

public protocol FlowStep: class {
    var navigationController: UINavigationController { get set }
    var viewController: UIViewController { get }

    var state: FlowStepState { get set }
    var delegate: FlowStepDelegate? { get set }

    var canNavigateBack: Bool { get set }

    init(navigationController: UINavigationController, delegate: FlowStepDelegate?)
    func start()
    func resume()
    func cancel()
}

public protocol FlowStepDelegate: class {
    func userNavigated(to destination: NavigationDestination)
    func stepCompleted(_ step: FlowStep)
    func stepCancelled(_ step: FlowStep)
}


// MARK: - Extensions

extension Flow {
    public func nextStep() {
        guard let step = steps.last else {
            self.delegate?.stepCompleted(self)
            return
        }

        startStep(step)
    }

    fileprivate func startStep(_ step: FlowStep) {
        guard Thread.isMainThread else { DispatchQueue.main.async(execute: { self.startStep(step) });  return }

        updateNavigationItem(forStep: step)

        step.start()
    }
}


// MARK: UINavigationItem Configuration

extension Flow {

    public func updateNavigationItem(forStep step: FlowStep) {
        // the first step's ability to go back is the same as the flow's value
        if steps.count == 1 {
            step.canNavigateBack = canNavigateBack
        }

        setupBackButton(forStep: step)
    }

    private func setupBackButton(forStep step: FlowStep) {
        let hideBackButton: Bool

        if steps.count == 1 {
            hideBackButton = (canNavigateBack == false)
        } else {
            hideBackButton = (step.canNavigateBack == false)
        }

        step.viewController.navigationItem.hidesBackButton = hideBackButton
    }
}

