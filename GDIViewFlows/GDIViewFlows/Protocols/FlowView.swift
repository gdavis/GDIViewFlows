//
//  FlowView.swift
//  GDIViewFlows
//
//  Created by Grant Davis on 2/5/18.
//  Copyright © 2018 Grant Davis Interactive. All rights reserved.
//

import Foundation

// This protocol is typically implemented by UIViewControllers that are managed by a FlowStep. It allows
// the implementing object to interact with the FlowStep it is associated with.
public protocol FlowView {
    associatedtype ViewStep: FlowStep

    var step: ViewStep? { get set }
}
