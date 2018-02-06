//
//  RegisterViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import UIKit
import GDIViewFlows

class RegisterViewController: UIViewController, StoryboardViewController, FlowView {

    // MARK: - FlowView

    typealias ViewStep = RegisterStep
    var step: RegisterStep?

    // MARK: - StoryboardViewController

    static var storyboardName: String = "RegisterView"

    // MARK: - Outlets

    @IBOutlet var optionalViewSwitch: UISwitch!

    // MARK: - Actions

    @IBAction func registerAction(_ sender: Any) {
        // step.register(
    }
}
