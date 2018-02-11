//
//  LaunchPrepStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class LaunchPrepStep: BaseFlowStep {
    override var viewController: UIViewController {
        return launchViewController
    }

    lazy var launchViewController: UIViewController = {
        guard let controller: LaunchPrepViewController = try? LaunchPrepViewController.instantiatedFromStoryboard() else { return LaunchPrepViewController() }

        controller.step = self

        return controller
    }()
}

class LaunchPrepViewController: UITableViewController, StoryboardViewController, FlowView {
    // MARK: - StoryboardViewController Protocol

    static var storyboardName: String = "LaunchPrepView"

    // MARK: - FlowView Protocol

    typealias ViewStep = LaunchPrepStep
    var step: ViewStep?

    @IBAction func prepFinished() {
        step?.finish()
    }
}
