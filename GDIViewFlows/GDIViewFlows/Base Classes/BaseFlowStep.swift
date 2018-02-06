//
//  BaseFlowStep.swift
//  GDIViewFlows
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import UIKit

open class BaseFlowStep: NSObject, FlowStep, UINavigationControllerDelegate {

    public var state: FlowStepState = .unstarted
    public var navigationController: UINavigationController
    public var delegate: FlowStepDelegate?
    public var canNavigateBack = true

    open var viewController: UIViewController {
        assertionFailure("Subclasses must return a custom view controller")
        return UIViewController()
    }

    public required init(navigationController: UINavigationController, delegate: FlowStepDelegate?) {
        self.navigationController = navigationController
        self.delegate = delegate
    }

    open func start() {
        self.navigationController.delegate = self
        self.state = .started

        display()
    }

    open func finish() {
        state = .finished

        delegate?.stepCompleted(self)
    }

    open func display() {
        guard Thread.isMainThread else { performOnMainThread { [weak self] in self?.display() }; return }

        if navigationController.viewControllers.contains(viewController) {
            navigationController.popToViewController(viewController, animated: true)
        } else {
            if navigationController.viewControllers.isEmpty {
                navigationController.setViewControllers([viewController], animated: false)
            } else {
                navigationController.pushViewController(viewController, animated: true)
            }
        }
    }
}


// MARK: - UINavigationControllerDelegate

extension BaseFlowStep {

    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // if the navigation controller no longer contains this view, cancel this step.
        if !navigationController.viewControllers.contains(self.viewController) {
            delegate?.stepCancelled(self)
        }
    }
}


// MARK: - Private Thread Helper

private extension FlowStep {
    func performOnMainThread(_ block: @escaping () -> Void) {
        guard Thread.isMainThread else { block(); return }

        DispatchQueue.main.async {
            block()
        }
    }
}
