//
//  ForgotPasswordViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/7/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class ForgotPasswordViewController: UIViewController, StoryboardViewController, FlowView {
    typealias ViewStep = ForgotPasswordStep
    var step: ViewStep?

    static var storyboardName: String = "ForgotPasswordView"

    @IBAction func resetPasswordAction(_ sender: Any) {
        step?.submitResetPasswordRequest(forEmail: "user@email.com")
    }
}
