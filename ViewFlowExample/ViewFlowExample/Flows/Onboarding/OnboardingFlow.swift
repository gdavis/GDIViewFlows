//
//  OnboardingFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import GDIViewFlows

/// Manages the login flow (login + update profile), register, and reset password.
/// Below is an example of how the screens flow together.
class OnboardingFlow: BaseFlow {

    // MARK: - Flow Navigation

    // TODO:(grant) I'm not crazy about having to reference OnboardingFlow.Destination in child flows, which
    // creates a dependency that the step knows that it is part of the onboarding flow. should be more generic
    enum Destination: String, NavigationDestination {
        case login, register, forgotPassword
    }

    // MARK: - Flow Steps

    fileprivate lazy var loginStep: LoginFlow = {
        return LoginFlow(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var registerStep: RegisterStep = {
        return RegisterStep(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var forgotPasswordStep: ForgotPasswordStep = {
        return ForgotPasswordStep(navigationController: navigationController, delegate: self)
    }()

    
    // MARK: - FlowStepDelegate Overrides

    override var initialStep: FlowStep {
        return loginStep
    }

    override func userNavigated(to destination: NavigationDestination) {
        guard let onboardingDestination = destination as? OnboardingFlow.Destination else { return }

        switch onboardingDestination {
        case .login:
            // login is only accessible from the register view,
            // so we can cancel the current register step to return to login.
            currentStep?.cancel()

        case .register:
            appendAndStart(step: registerStep)

        case .forgotPassword:
            appendAndStart(step: forgotPasswordStep)
        }
    }

    override func stepCompleted(_ step: FlowStep) {
        switch step {
        case is LoginFlow:
            finish()

        case is RegisterStep:
            if registerStep.showOptionalView {
                let optionalStep = RegisterSurveyStep(navigationController: navigationController, delegate: self)
                optionalStep.canNavigateBack = false

                appendAndStart(step: optionalStep)
            } else {
                finish()
            }

        case is ForgotPasswordStep:
            popToPreviousStep()

        case is RegisterSurveyStep:
            finish()

        default:
            break
        }
    }
}
