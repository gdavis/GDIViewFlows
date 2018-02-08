//
//  ForgotPasswordStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/7/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import GDIViewFlows

class ForgotPasswordStep: BaseFlowStep {

    override var viewController: UIViewController {
        return forgotPasswordViewController
    }

    lazy var forgotPasswordViewController: ForgotPasswordViewController = {
        guard let controller: ForgotPasswordViewController = try? ForgotPasswordViewController.instantiatedFromStoryboard() else { return ForgotPasswordViewController() }

        controller.step = self

        return controller
    }()

    func submitResetPasswordRequest(forEmail email: String) {
        finish()
    }
}
