//
//  UIActivityIndicatorViewExtension.swift
//  ActivityIndicatable
//
//  Created by Quentin Ribierre on 8/1/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UIActivityIndicatorView {

    convenience init(color: UIColor) {
        self.init()

        self.color = color
    }

    convenience init(customAnimationView: UIView) {
        self.init()
        self.color = UIColor.clearColor()

        customAnimationView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(customAnimationView)
        let horizontalConstraint = customAnimationView.centerXAnchor.constraintEqualToAnchor(centerXAnchor)
        let verticalConstraint = customAnimationView.centerYAnchor.constraintEqualToAnchor(centerYAnchor)
        let widthConstraint = customAnimationView.widthAnchor.constraintEqualToAnchor(nil, constant: customAnimationView.frame.width)
        let heightConstraint = customAnimationView.heightAnchor.constraintEqualToAnchor(nil, constant: customAnimationView.frame.height)
        NSLayoutConstraint.activateConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

}