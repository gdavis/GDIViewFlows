//
//  ChooseDestinationViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/8/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class ChooseDestinationStep: BaseFlowStep {
    override var viewController: UIViewController {
        return chooseDestinationViewController
    }

    private lazy var chooseDestinationViewController: ChooseDestinationViewController = {
        guard let controller: ChooseDestinationViewController = try? ChooseDestinationViewController.instantiatedFromStoryboard() else { return ChooseDestinationViewController() }

        controller.step = self

        return controller
    }()

    var selectedDestination: ChooseDestinationViewController.MissionDestination?

    func destinationSelected(_ destination: ChooseDestinationViewController.MissionDestination) {
        selectedDestination = destination

        finish()
    }
}

class ChooseDestinationViewController: UITableViewController, StoryboardViewController, FlowView {
    static var storyboardName: String = "ChooseDestinationView"

    typealias ViewStep = ChooseDestinationStep
    var step: ChooseDestinationStep?

    enum MissionDestination: Int {
        case mars
        case jupiter
        case saturn
        case kronos
        case alphaCentauri
        case tatooine

        var name: String {
            switch self {
            case .mars:
                return "Mars"
            case .jupiter:
                return "Jupiter"
            case .saturn:
                return "Saturn"
            case .kronos:
                return "Kronos"
            case .alphaCentauri:
                return "Alpha Centauri"
            case .tatooine:
                return "Tatooine"
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let destination = MissionDestination(rawValue: indexPath.row) else { return }

        step?.destinationSelected(destination)
    }
}
