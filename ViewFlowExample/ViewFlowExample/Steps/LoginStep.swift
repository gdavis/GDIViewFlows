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

        // here we spoof a network request and proceed after a short delay
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) { [weak self] in
            // user would now be logged in, finish this step.
            self?.finish()
        }
    }

    func createAccount() {
        delegate?.userNavigated(to: OnboardingFlowNavigation.register)
    }

    func forgotPassword() {
        delegate?.userNavigated(to: OnboardingFlowNavigation.forgotPassword)
    }
}
