//
//  LoginStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import GDIViewFlows

class LoginStep: BaseFlowStep {
    override var viewController: UIViewController {
        return loginViewController
    }

    private lazy var loginViewController: LoginViewController = {
        guard let controller: LoginViewController = try? LoginViewController.instantiatedFromStoryboard() else { return LoginViewController() }

        controller.step = self

        return controller
    }()
}

// MARK: - View Actions

extension LoginStep {
    func login(withUsername username: String?, password: String?) {
        finish()
    }

    func createAccount() {
        delegate?.userNavigated(to: OnboardingFlow.Destination.register)
    }

    func forgotPassword() {
        delegate?.userNavigated(to: OnboardingFlow.Destination.forgotPassword)
    }
}
