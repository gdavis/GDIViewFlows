//
//  UIViewController+Storyboard.swift
//  ViewFlowExample
//
//  Created by Grant Davis on 1/11/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardViewControllerError: Error {
    case failedToLoadFromStoryboard
}

protocol StoryboardViewController {
    static var storyboardName: String { get }
}

extension StoryboardViewController where Self: UIViewController {
    static func instantiatedFromStoryboard<T: StoryboardViewController>() throws -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)

        if let controller = storyboard.instantiateInitialViewController() as? T {
            return controller
        } else {
            throw StoryboardViewControllerError.failedToLoadFromStoryboard
        }
    }
}
