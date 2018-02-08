//
//  LoginViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import UIKit
import GDIViewFlows

class LoginViewController: UIViewController, StoryboardViewController, FlowView {

    // MARK: - StoryboardViewController Protocol

    static var storyboardName: String = "LoginView"

    // MARK: - FlowView Protocol

    typealias ViewStep = LoginStep

    var step: ViewStep?

    // MARK: - Outlets

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!

    // MARK: - Actions

    @IBAction func loginAction(_ sender: Any) {
        if let username = usernameField.text, let password = passwordField.text {
            step?.login(withUsername: username, password: password)
        } else {
            // show validation error
        }
    }

    @IBAction func createAccountAction(_ sender: Any) {
        step?.createAccount()
    }

    @IBAction func forgotPasswordAction(_ sender: Any) {
        step?.forgotPassword()
    }
}
