//
//  OrbitalTourFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class OrbitalTourFlow: BaseFlow {

    // MARK: - Properties

    lazy var optionsStep: TourOptionsFlow = {
        return TourOptionsFlow(navigationController: navigationController, delegate: self)
    }()

    lazy var onboardingFlow: OnboardingFlow = {
        return OnboardingFlow(navigationController: navigationController, delegate: self)
    }()

    lazy var launchFlow: LaunchFlow = {
        return LaunchFlow(navigationController: navigationController, delegate: self)
    }()

    // MARK: - BaseFlow

    override var initialStep: FlowStep {
        return optionsStep
    }

    override func stepCompleted(_ step: FlowStep) {
        switch step {
        case is TourOptionsFlow:
            appendAndStart(step: onboardingFlow)
        case is OnboardingFlow:
            launchFlow.canNavigateBack = false

            appendAndStart(step: launchFlow)
        case is LaunchFlow:
            finish()
        default:
            assertionFailure("Completed step not handled")
        }
    }
}
