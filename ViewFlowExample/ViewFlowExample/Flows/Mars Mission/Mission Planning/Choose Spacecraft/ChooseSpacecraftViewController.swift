//
//  ChooseSpacecraftViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/8/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class ChooseSpacecraftStep: BaseFlowStep {
    override var viewController: UIViewController {
        return chooseSpacecraftViewController
    }

    private lazy var chooseSpacecraftViewController: ChooseSpacecraftViewController = {
        guard let controller: ChooseSpacecraftViewController = try? ChooseSpacecraftViewController.instantiatedFromStoryboard() else { return ChooseSpacecraftViewController() }

        controller.step = self

        return controller
    }()

    var selectedSpacecraft: ChooseSpacecraftViewController.Spacecraft?

    func spacecraftSelected(_ spacecraft: ChooseSpacecraftViewController.Spacecraft) {
        selectedSpacecraft = spacecraft

        finish()
    }
}

class ChooseSpacecraftViewController: UITableViewController, StoryboardViewController, FlowView {
    static var storyboardName: String = "ChooseSpacecraftView"

    typealias ViewStep = ChooseSpacecraftStep
    var step: ChooseSpacecraftStep?

    enum Spacecraft: Int {
        case falconHeavy, milleniumFalcon, enterprise, battlestarGalactica

        var name: String {
            switch self {
            case .falconHeavy:
                return "The SpaceX Falcon Heavy"
            case .enterprise:
                return "The U.S.S. Enterprise"
            case .milleniumFalcon:
                return "Millenium Falcon"
            case .battlestarGalactica:
                return "Battlestar Galactica"
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let spacecraft = Spacecraft(rawValue: indexPath.row) else { return }

        step?.spacecraftSelected(spacecraft)
    }
}
