//
//  MissionSummaryStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/7/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import GDIViewFlows

class MissionSummaryStep: BaseFlowStep {

    // MARK: - BaseFlowStep Overrides

    override var viewController: UIViewController {
        return summaryViewController
    }

    private lazy var summaryViewController: MissionSummaryViewController = {
        guard let controller: MissionSummaryViewController = try? MissionSummaryViewController.instantiatedFromStoryboard() else { return MissionSummaryViewController() }

        controller.step = self

        return controller
    }()

    // MARK: - Choose Missions

    enum MissionOption: Int, NavigationDestination {
        case role, spacecraft, destination
    }

    func chooseOption(_ option: MissionOption) {
        delegate?.userNavigated(to: option)
    }
}
