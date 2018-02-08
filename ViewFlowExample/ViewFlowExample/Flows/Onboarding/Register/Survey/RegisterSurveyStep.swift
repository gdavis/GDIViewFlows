//
//  RegisterSurveyStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/5/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import GDIViewFlows

class RegisterSurveyStep: BaseFlowStep {

    override var viewController: UIViewController {
        return optionalSettingsViewController
    }

    lazy var optionalSettingsViewController: RegisterSurveyViewController = {
        guard let controller: RegisterSurveyViewController = try? RegisterSurveyViewController.instantiatedFromStoryboard() else { return RegisterSurveyViewController() }

        controller.step = self

        return controller
    }()

    func complete(withSettings settings: [Bool]) {
        // (do something with the settings)
        finish()
    }
}
