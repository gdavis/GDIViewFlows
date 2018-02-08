//
//  MissionSummaryStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/7/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import GDIViewFlows

class MissionSummaryStep: BaseFlowStep {

    // MARK: - Properties

    var selectedRole: ChooseRoleViewController.Role?
    var selectedShip: ChooseSpacecraftViewController.Spacecraft?
    var selectedDestination: ChooseDestinationViewController.MissionDestination?

    // MARK: - BaseFlowStep Overrides

    override var viewController: UIViewController {
        return summaryViewController
    }

    private lazy var summaryViewController: MissionSummaryViewController = {
        guard let controller: MissionSummaryViewController = try? MissionSummaryViewController.instantiatedFromStoryboard() else { return MissionSummaryViewController() }

        controller.step = self

        return controller
    }()

    override func resume() {
        super.resume()

        summaryViewController.roleLabel.text = selectedRole?.name
        summaryViewController.spacecraftLabel.text = selectedShip?.name
        summaryViewController.destinationLabel.text = selectedDestination?.name
    }

    // MARK: - Choose Missions

    // TODO:(grant) Similar enums are in the view controller. Should it be moved?
    enum MissionOption: Int, NavigationDestination {
        case role, spacecraft, destination
    }

    func chooseOption(_ option: MissionOption) {
        delegate?.userNavigated(to: option)
    }
}
