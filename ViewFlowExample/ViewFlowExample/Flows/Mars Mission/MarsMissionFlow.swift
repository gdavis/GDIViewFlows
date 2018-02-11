//
//  MissionFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/7/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import GDIViewFlows

class MarsMissionFlow: BaseFlow {

    // MARK: - Steps

    fileprivate lazy var onboardingFlow: OnboardingFlow = {
        return OnboardingFlow(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var planningFlow: MissionPlanningFlow = {
        return MissionPlanningFlow(navigationController: navigationController, delegate: self)
    }()

    lazy var launchFlow: LaunchFlow = {
        return LaunchFlow(navigationController: navigationController, delegate: self)
    }()

    // MARK: - FlowStepDelegate Overrides

    override var initialStep: FlowStep {
        return planningFlow
    }

    override func stepCompleted(_ step: FlowStep) {
        switch step {
        case is MissionPlanningFlow:
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
