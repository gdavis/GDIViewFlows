//
//  SelectSeatsStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class SelectSeatsStep: BaseFlowStep {
    override var viewController: UIViewController {
        return selectSeatController
    }

    private lazy var selectSeatController: SelectSeatViewController = {
        guard let controller: SelectSeatViewController = try? SelectSeatViewController.instantiatedFromStoryboard() else { return SelectSeatViewController() }

        controller.step = self

        return controller
    }()

    func seatSelected(_ seat: Any) {
        finish()
    }
}

class SelectSeatViewController: UITableViewController, StoryboardViewController, FlowView {
    // MARK: - StoryboardViewController Protocol

    static var storyboardName: String = "SelectSeatView"

    // MARK: - FlowView Protocol

    typealias ViewStep = SelectSeatsStep
    var step: ViewStep?

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        step?.seatSelected(indexPath)
    }
}
