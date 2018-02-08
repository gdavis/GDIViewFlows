//
//  RegisterStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import GDIViewFlows

class RegisterStep: BaseFlowStep {

    override var viewController: UIViewController {
        return registerViewController
    }

    lazy var registerViewController: RegisterViewController = {
        guard let controller: RegisterViewController = try? RegisterViewController.instantiatedFromStoryboard() else { return RegisterViewController() }

        controller.step = self

        return controller
    }()

    private (set) var username: String?
    private (set) var showOptionalView: Bool = false

    func register(username: String, password: String, showOptionalView: Bool) {
        self.username = username
        self.showOptionalView = showOptionalView

        finish()
    }

    func navigateToLogin() {
        delegate?.userNavigated(to: OnboardingFlow.Destination.login)
    }
}
