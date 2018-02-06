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

        return controller
    }()

    private (set) var username: String?
    private (set) var showOptionalView: Bool = false

    func register(username: String, password: String, showOptionalView: Bool) {
        self.username = username
        self.showOptionalView = showOptionalView

        // here we'd perform an API call and handle the response.
        // when we get a successful login, we'd complete the step.
        // for this demo, we fake the API call and move on
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) { [weak self] in
            self?.finish()
        }
    }
}
