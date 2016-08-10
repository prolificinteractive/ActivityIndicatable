//
//  ActivityIndicatable.swift
//  ActivityIndicatableDemo
//
//  Created by Quentin Ribierre on 7/29/16.
//  Copyright © 2016 Prolific Interactive Corp. All rights reserved.
//

import UIKit

/**
 *  A protocol for Activity Indicators.
 */
public protocol ActivityIndicatable {

    func activityIndicator(activityIndicatorStyle: UIActivityIndicatorViewStyle) -> UIActivityIndicatorView

    /**
     Starts the Activity Indicator.
     */
    func startActivityIndicator()

    func startActivityIndicator(activityIndicatorStyle: UIActivityIndicatorViewStyle)

    func startAnimatingWithIndicator(indicator: UIActivityIndicatorView)

    /**
     Indicates if the indicator is currently animated.

     - returns: A Boolean that indicates if the indicator is currently animated.
     */
    func isAnimating() -> Bool

    /**
     Stops the Activity Indicator.
     */
    func stopActivityIndicator()

}

extension UIView: ActivityIndicatable {

    public func activityIndicator(activityIndicatorStyle: UIActivityIndicatorViewStyle) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(activityIndicatorStyle: activityIndicatorStyle)
    }

    public func startActivityIndicator() {
        guard !isAnimating() else {
            return
        }

        let isLightColor = backgroundColor?.isLightColor() ?? true
        let activityIndicatorStyle: UIActivityIndicatorViewStyle = (isLightColor) ? .Gray : .White
        startActivityIndicator(activityIndicatorStyle)
    }

    public func startActivityIndicator(activityIndicatorStyle: UIActivityIndicatorViewStyle) {
        guard !isAnimating() else {
            return
        }

        let indicator = activityIndicator(activityIndicatorStyle)
        startAnimatingWithIndicator(indicator)
    }

    public func startAnimatingWithIndicator(indicator: UIActivityIndicatorView) {
        addSubview(indicator)

        indicator.translatesAutoresizingMaskIntoConstraints = false

        let margins = self.layoutMarginsGuide
        indicator.centerXAnchor.constraintEqualToAnchor(margins.centerXAnchor).active = true
        indicator.centerYAnchor.constraintEqualToAnchor(margins.centerYAnchor).active = true

        userInteractionEnabled = false
        indicator.startAnimating()
    }

    public func isAnimating() -> Bool {
        let activityIndicatorViews = subviews.filter {
            if let view = $0 as? UIActivityIndicatorView {
                return view.isAnimating()
            }
            return false
        }

        return activityIndicatorViews.count > 0
    }

    public func stopActivityIndicator() {
        userInteractionEnabled = true
        for view in subviews {
            if let view = view as? UIActivityIndicatorView {
                view.stopAnimating()
                view.removeFromSuperview()
            }
        }
    }

}

extension UIViewController: ActivityIndicatable {

    public func activityIndicator(activityIndicatorStyle: UIActivityIndicatorViewStyle) -> UIActivityIndicatorView {
        return view.activityIndicator(activityIndicatorStyle)
    }

    public func startActivityIndicator() {
        view.startActivityIndicator()
    }

    public func startActivityIndicator(activityIndicatorStyle: UIActivityIndicatorViewStyle) {
        view.startActivityIndicator(activityIndicatorStyle)
    }

    public func startAnimatingWithIndicator(indicator: UIActivityIndicatorView) {
        view.startAnimatingWithIndicator(indicator)
    }

    public func isAnimating() -> Bool {
        return view.isAnimating()
    }

    public func stopActivityIndicator() {
        view.stopActivityIndicator()
    }

}

public extension UIButton {

    override func startActivityIndicator() {
        titleLabel?.removeFromSuperview()
        enabled = false

        super.startActivityIndicator()
    }

    override func stopActivityIndicator() {
        super.stopActivityIndicator()

        defer { enabled = true }

        guard let titleLabel = titleLabel else {
            return
        }
        
        addSubview(titleLabel)
    }
}

private extension UIColor {

    // Reference: http://stackoverflow.com/questions/2509443/check-if-uicolor-is-dark-or-bright
    /**
     Checks the underlying values of RGB of a color using the formula ((RedVal * 299) + (GreenVal * 587) + (BlueVal * 114)) / 1,000 to get the color brightness.

     - returns: *true* if the value from above formula is greater than 155. *false* is lower than 155.
     */
    func isLightColor() -> Bool {
        // Reference: https://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CGColor/
        let count = CGColorGetNumberOfComponents(CGColor)
        let componentColors: UnsafePointer<CGFloat> = CGColorGetComponents(CGColor)

        var darknessScore: CGFloat = 0

        let maxByte = CGFloat(UInt8.max)
        let middleDarknessScore: CGFloat = 155.0

        if count == 2 {
            let darknessScore1 = (componentColors[0] * maxByte) * 299
            let darknessScore2 = (componentColors[0] * maxByte) * 587
            let darknessScore3 = (componentColors[0] * maxByte) * 114

            darknessScore = (darknessScore1 + darknessScore2 + darknessScore3) / CGFloat(1000.0)
        } else if count == 4 {
            let darknessScore1 = (componentColors[0] * maxByte) * 299
            let darknessScore2 = (componentColors[1] * maxByte) * 587
            let darknessScore3 = (componentColors[2] * maxByte) * 114

            darknessScore = (darknessScore1 + darknessScore2 + darknessScore3) / CGFloat(1000.0)
        }
        // Value of 155 is used to account for non-RGB colors such as whiteColor, grayColor, blackColor. Traditional RGB color value would be 125.
        return darknessScore > middleDarknessScore
    }

}