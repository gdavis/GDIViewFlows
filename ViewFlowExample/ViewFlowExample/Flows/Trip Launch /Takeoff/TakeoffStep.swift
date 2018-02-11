//
//  TakeoffStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class TakeoffStep: BaseFlowStep {
    override var viewController: UIViewController {
        return takeoffController
    }

    lazy var takeoffController: TakeoffViewController = {
        guard let controller: TakeoffViewController = try? TakeoffViewController.instantiatedFromStoryboard() else { return TakeoffViewController() }

        controller.step = self

        return controller
    }()
}

class TakeoffViewController: UIViewController, StoryboardViewController, FlowView {
    // MARK: - StoryboardViewController Protocol

    static var storyboardName: String = "TakeoffView"

    // MARK: - FlowView Protocol

    typealias ViewStep = TakeoffStep
    var step: ViewStep?

    @IBAction func takeoffAction(_ sender: Any) {
        step?.finish()
    }
}
