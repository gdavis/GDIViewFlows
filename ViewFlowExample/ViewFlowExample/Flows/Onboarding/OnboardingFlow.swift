//
//  OnboardingFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import GDIViewFlows


enum OnboardingFlowNavigation: String, NavigationDestination {
    case login, register, forgotPassword
}

/// Manages the login flow (login + update profile), register, and reset password.
/// Below is an example of how the screens flow together.
class OnboardingFlow: BaseFlow {

    override var initialStep: FlowStep {
        return loginStep
    }

    private lazy var loginStep: FlowStep = {
        return LoginFlow(navigationController: navigationController, delegate: self)
    }()

    private lazy var registerStep: FlowStep = {
        return RegisterStep(navigationController: navigationController, delegate: self)
    }()
}

extension OnboardingFlow: FlowStepDelegate {
    func userNavigated(to destination: NavigationDestination) {
        guard let onboardingDestination = destination as? OnboardingFlowNavigation else { return }

        switch onboardingDestination {
        case .login:
            break
        case .register:
            break
        case .forgotPassword:
            break
        }
    }

    func stepCancelled(_ step: FlowStep) {
    }

    func stepCompleted(_ step: FlowStep) {
        switch step {
        case is LoginFlow:
            break

        case let registerStep as RegisterStep:
            if registerStep.showOptionalView {
                let optionalStep = OptionalSettingsStep(navigationController: navigationController, delegate: self)
                appendAndStart(step: optionalStep)
            } else {
                finish()
            }

        default:
            break
        }
    }
}
