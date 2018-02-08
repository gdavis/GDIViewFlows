//
//  MissionFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/7/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import GDIViewFlows

class MissionFlow: BaseFlow {

    // MARK: - Steps

    fileprivate lazy var onboardingFlow: OnboardingFlow = {
        return OnboardingFlow(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var planningFlow: MissionPlanningFlow = {
        let planningFlow = MissionPlanningFlow(navigationController: navigationController, delegate: self)

        // after onboarding, we can't go back since we're logged in with a user. 
        planningFlow.canNavigateBack = false

        return planningFlow
    }()

//    fileprivate lazy var launchFlow: OnboardingFlow = {
//        return OnboardingFlow(navigationController: navigationController, delegate: self)
//    }()


    // MARK: - FlowStepDelegate Overrides

    override var initialStep: FlowStep {
        return onboardingFlow
    }

    override func stepCompleted(_ step: FlowStep) {
        switch step {
        case is OnboardingFlow:
            appendAndStart(step: planningFlow)
            
        case is MissionPlanningFlow:
//            appendAndStart(step: launchFlow)
            break

        default:
            break
        }
    }
}
