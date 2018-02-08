//
//  OptionalSettingsStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/5/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import GDIViewFlows

class OptionalSettingsStep: BaseFlowStep {

    override var viewController: UIViewController {
        return optionalSettingsViewController
    }

    lazy var optionalSettingsViewController: OptionalSettingsViewController = {
        guard let controller: OptionalSettingsViewController = try? OptionalSettingsViewController.instantiatedFromStoryboard() else { return OptionalSettingsViewController() }

        controller.step = self

        return controller
    }()

    func complete(withSettings settings: [Bool]) {
        // (do something with the settings)
        finish()
    }
}
