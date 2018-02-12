//
//  MissionSummaryViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/7/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class MissionSummaryViewController: UITableViewController, StoryboardViewController, FlowView {

    // MARK: - FlowView

    typealias ViewStep = MissionSummaryStep
    var step: ViewStep?

    // MARK: - Outlets

    @IBOutlet var roleLabel: UILabel!
    @IBOutlet var spacecraftLabel: UILabel!
    @IBOutlet var destinationLabel: UILabel!

    // MARK: - StoryboardViewController

    static var storyboardName: String = "MissionSummaryView"

    // MARK: - UITableViewController

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let option = MissionSummaryStep.MissionOption(rawValue: indexPath.row) else { return }

        step?.chooseOption(option)
    }

    // MARK: - Actions

    @IBAction func takeOffAction(_ sender: Any) {
        step?.ready()
    }
}
