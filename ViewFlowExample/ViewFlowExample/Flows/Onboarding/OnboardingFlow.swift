//
//  OnboardingFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//
import GDIViewFlows

class OnboardingFlow: BaseFlow {

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
        if let loginFlowDestination = destination as? LoginStep.Destination {
            switch loginFlowDestination {
            case .register:
                appendAndStart(step: registerStep)

            case .forgotPassword:
                appendAndStart(step: forgotPasswordStep)
            }
        }

        if let registerDestination = destination as? RegisterStep.Destination {
            switch registerDestination {
            case .login:
                // login is only accessible from the register view,
                // so we can cancel the current register step to return to login.
                currentStep?.cancel()
            }
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
