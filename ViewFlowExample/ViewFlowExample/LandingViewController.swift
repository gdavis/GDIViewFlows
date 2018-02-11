//
//  LandingViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import UIKit
import GDIViewFlows

class LandingViewController: UIViewController, StoryboardViewController {

    // MARK: - Properties

    private var currentFlow: BaseFlow?

    // MARK: - StoryboardViewController

    static var storyboardName: String = "LandingView"

    // MARK: - Actions

    @IBAction func orbitalTourAction(_ sender: Any) {
        guard let navigationController = navigationController else { return }

        let flow = OrbitalTourFlow(navigationController: navigationController, delegate: self)
        flow.start()
        
        currentFlow = flow
    }

    @IBAction func marsEmmigrationAction(_ sender: Any) {
        guard let navigationController = navigationController else { return }

        let flow = MarsMissionFlow(navigationController: navigationController, delegate: self)
        flow.start()

        currentFlow = flow
    }

    @IBAction func loginAction(_ sender: Any) {
        guard let navigationController = navigationController else { return }

        let flow = OnboardingFlow(navigationController: navigationController, delegate: self)
        flow.start()

        currentFlow = flow
    }
}

extension LandingViewController: FlowStepDelegate {
    func userNavigated(to destination: NavigationDestination) {}

    func stepCancelled(_ step: FlowStep) {
        currentFlow = nil
        navigationController?.popToRootViewController(animated: true)
    }

    func stepCompleted(_ step: FlowStep) {
        currentFlow = nil
        navigationController?.popToRootViewController(animated: true)
    }
}
