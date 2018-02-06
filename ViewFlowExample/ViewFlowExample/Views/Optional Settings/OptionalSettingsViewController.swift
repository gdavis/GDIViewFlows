//
//  OptionalSettingsViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/5/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class OptionalSettingsViewController: UITableViewController, StoryboardViewController, FlowView {

    typealias ViewStep = OptionalSettingsStep

    var step: OptionalSettingsStep?

    static var storyboardName: String = "OptionalSettingsView"


    @IBAction func nextAction(_ sender: Any) {
        // normally you'd pull the values from the controls, for examples sake we skip that
        step?.complete(withSettings: [true, true, false])
    }
}
