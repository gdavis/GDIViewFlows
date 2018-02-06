//
//  PostLoginStep.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import GDIViewFlows

class PostLoginStep: BaseFlowStep {

    override var viewController: UIViewController {
        return postLoginViewController
    }

    private lazy var postLoginViewController: PostLoginViewController = {
        guard let controller: PostLoginViewController = try? PostLoginViewController.instantiatedFromStoryboard() else { return PostLoginViewController() }

        controller.step = self

        return controller
    }()

    func postLoginFinished() {
        finish()
    }
}
