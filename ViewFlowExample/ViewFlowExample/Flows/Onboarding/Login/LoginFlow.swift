//
//  LoginFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import GDIViewFlows

// Manages the flow from the login screen to
class LoginFlow: BaseFlow {

    override var initialStep: FlowStep {
        return loginStep
    }

    private lazy var loginStep: LoginStep = {
        return LoginStep(navigationController: navigationController, delegate: self)
    }()

    private lazy var postLoginStep: PostLoginStep = {
        let step = PostLoginStep(navigationController: navigationController, delegate: self)

        // since it does not make sense to be able to login again, we prevent the user from going back.
        step.canNavigateBack = false

        return step
    }()
}


extension LoginFlow: FlowStepDelegate {
    func userNavigated(to destination: NavigationDestination) {
        // forward up onboarding navigation to the parent flow
        guard let loginDestination = destination as? OnboardingFlowNavigation else { return }

        switch loginDestination {
        case .login, .register, .forgotPassword:
            delegate?.userNavigated(to: loginDestination)
        }
    }

    func stepCancelled(_ step: FlowStep) {
    }

    func stepCompleted(_ step: FlowStep) {
        switch step {
        case is LoginStep:
            appendAndStart(step: postLoginStep)

         case is PostLoginStep:
            finish()

        default:
            assertionFailure("Unexpeted step completed")
        }
    }
}
