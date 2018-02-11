//
//  MissionPlanningFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/7/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import GDIViewFlows

class MissionPlanningFlow: BaseFlow {

    // MARK: - Steps

    fileprivate lazy var summaryStep: MissionSummaryStep = {
        return MissionSummaryStep(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var chooseRoleStep: ChooseRoleStep = {
        return ChooseRoleStep(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var chooseSpacecraftStep: ChooseSpacecraftStep = {
        return ChooseSpacecraftStep(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var chooseDestinationStep: ChooseDestinationStep = {
        return ChooseDestinationStep(navigationController: navigationController, delegate: self)
    }()

    // MARK: - FlowStepDelegate Overrides

    override var initialStep: FlowStep {
        return summaryStep
    }

    override func userNavigated(to destination: NavigationDestination) {
        if let chooseOption = destination as? MissionSummaryStep.MissionOption {
            switch chooseOption {
            case .role:
                appendAndStart(step: chooseRoleStep)

            case .spacecraft:
                appendAndStart(step: chooseSpacecraftStep)

            case .destination:
                appendAndStart(step: chooseDestinationStep)
            }
        }
    }

    override func stepCompleted(_ step: FlowStep) {
        switch step {
        case is ChooseRoleStep:
            summaryStep.selectedRole = chooseRoleStep.selectedRole
            popToPreviousStep()

        case is ChooseSpacecraftStep:
            summaryStep.selectedShip = chooseSpacecraftStep.selectedSpacecraft
            popToPreviousStep()

        case is ChooseDestinationStep:
            summaryStep.selectedDestination = chooseDestinationStep.selectedDestination
            popToPreviousStep()

        case is MissionSummaryStep:
            finish()

        default:
            break
        }
    }
}
