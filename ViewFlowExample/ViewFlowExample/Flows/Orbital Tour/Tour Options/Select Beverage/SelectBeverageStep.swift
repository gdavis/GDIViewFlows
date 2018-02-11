//
//  SelectBeverageStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class SelectBeverageStep: BaseFlowStep {

    override var viewController: UIViewController {
        return selectSeatController
    }

    private lazy var selectSeatController: SelectBeverageViewController = {
        guard let controller: SelectBeverageViewController = try? SelectBeverageViewController.instantiatedFromStoryboard() else { return SelectBeverageViewController() }

        controller.step = self

        return controller
    }()

    func beverageSelected(_ beverage: Any) {
        finish()
    }
}

class SelectBeverageViewController: UITableViewController, StoryboardViewController, FlowView {
    // MARK: - StoryboardViewController Protocol

    static var storyboardName: String = "SelectBeverageView"

    // MARK: - FlowView Protocol

    typealias ViewStep = SelectBeverageStep
    var step: ViewStep?

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        step?.beverageSelected(indexPath)
    }
}
