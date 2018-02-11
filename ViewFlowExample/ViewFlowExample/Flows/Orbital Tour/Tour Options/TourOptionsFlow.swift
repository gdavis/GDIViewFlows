//
//  OrbitalTourFlow.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class TourOptionsFlow: BaseFlow {

    // MARK: - Steps

    fileprivate lazy var selectSeatStep: SelectSeatsStep = {
        return SelectSeatsStep(navigationController: navigationController, delegate: self)
    }()

    fileprivate lazy var selectBeverageStep: SelectBeverageStep = {
        return SelectBeverageStep(navigationController: navigationController, delegate: self)
    }()

    // MARK: - FlowStepDelegate Overrides

    override var initialStep: FlowStep {
        return selectSeatStep
    }

    override func stepCompleted(_ step: FlowStep) {
        switch step {
        case is SelectSeatsStep:
            appendAndStart(step: selectBeverageStep)

        case is SelectBeverageStep:
            finish()

        default:
            assertionFailure("Completed step not handled")
        }
    }
}
