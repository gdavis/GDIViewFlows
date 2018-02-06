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
    
    static var storyboardName: String = "LandingView"

    private var onboardingFlow: OnboardingFlow?

    @IBAction func loginAction(_ sender: Any) {
        guard let navigationController = navigationController else { return }

        let flow = OnboardingFlow(navigationController: navigationController, delegate: nil)
        flow.start()
        
        onboardingFlow = flow
    }
}
