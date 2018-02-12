//
//  ChooseRoleViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/8/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class ChooseRoleStep: BaseFlowStep {
    override var viewController: UIViewController {
        return chooseRoleViewController
    }

    private lazy var chooseRoleViewController: ChooseRoleViewController = {
        guard let controller: ChooseRoleViewController = try? ChooseRoleViewController.instantiatedFromStoryboard() else { return ChooseRoleViewController() }

        controller.step = self

        return controller
    }()

    var selectedRole: ChooseRoleViewController.Role?

    func roleSelected(_ role: ChooseRoleViewController.Role) {
        selectedRole = role

        finish()
    }
}

class ChooseRoleViewController: UITableViewController, StoryboardViewController, FlowView {
    static var storyboardName: String = "ChooseRoleView"

    typealias ViewStep = ChooseRoleStep
    var step: ChooseRoleStep?

    enum Role: Int {
        case cook, engineer, maintenance, doctor

        var name: String {
            switch self {
            case .cook:
                return "Cook"
            case .engineer:
                return "Engineer"
            case .maintenance:
                return "Maintenance"
            case .doctor:
                return "Doctor"
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let role = Role(rawValue: indexPath.row) else { return }

        step?.roleSelected(role)
    }
}
