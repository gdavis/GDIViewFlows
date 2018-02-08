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

    // TODO:(grant) finish step views
    fileprivate lazy var chooseRoleStep: BaseFlowStep = {
        return BaseFlowStep(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var chooseSpacecraftStep: BaseFlowStep = {
        return BaseFlowStep(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var chooseSuppliesStep: BaseFlowStep = {
        return BaseFlowStep(navigationController: navigationController, delegate: self)
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
                appendAndStart(step: chooseSuppliesStep)
            }
        }
    }

    override func stepCompleted(_ step: FlowStep) {
        // TODO:(grant) handle each step completing.
        // push into the next step automatically by checking if each step is complete.
        // this will allow us to show a user-started path at whatever point, but
        // still hit all the views in the flow.
    }
}
