//
//  LaunchFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class LaunchFlow: BaseFlow {

    lazy var prepStep: LaunchPrepStep = {
        return LaunchPrepStep.init(navigationController: navigationController, delegate: self)
    }()

    lazy var takeoffStep: TakeoffStep = {
        return TakeoffStep(navigationController: navigationController, delegate: self)
    }()

    override var initialStep: FlowStep {
        return prepStep
    }

    override func stepCompleted(_ step: FlowStep) {
        switch step {
        case is LaunchPrepStep:
            appendAndStart(step: takeoffStep)

        case is TakeoffStep:
            finish()

        default:
            assertionFailure("Completed step not handled")
        }
    }
}
