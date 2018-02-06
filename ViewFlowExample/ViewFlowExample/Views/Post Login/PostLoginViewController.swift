//
//  PostLoginViewController.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 2/5/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import UIKit
import GDIViewFlows

class PostLoginViewController: UIViewController, StoryboardViewController, FlowView {

    typealias ViewStep = PostLoginStep
    var step: PostLoginStep?

    static var storyboardName: String = "PostLoginView"

    @IBAction func nextAction(_ sender: Any) {
        step?.postLoginFinished()
    }
}
