//
//  MyAwesomeActivityIndicator.swift
//  ActivityIndicatableDemo
//
//  Created by Quentin Ribierre on 8/1/16.
//  Copyright © 2016 Prolific Interactive Corp. All rights reserved.
//

import ActivityIndicatable

extension UIView {

    // Dev note:
    // If this extension is not implemented, the default ActivityIndicatorView will be used.
    // (Gray or white depending of the background).
    //
    // To inject a custom loading spinner view:
    // Create the custom view with a frame,
    // start to animate this view (Better way will come),
    // and a new UIACtivityIndicatorView init with this custom view.
    public func activityIndicator(activityIndicatorStyle: UIActivityIndicatorViewStyle) -> UIActivityIndicatorView {
        let customAnimationView = ActivitySpinnerView()
        // Init the view with a frame is important,
        // the width and height of the frame will be set as the width and height constants of the constraints.
        customAnimationView.frame = CGRect(x: 0, y: 0, width: 45, height: 45)

        customAnimationView.addStartLoadingAnimationCompletionBlock { (finished) in
            customAnimationView.addLoadingAnimation()
        }

        return UIActivityIndicatorView(customAnimationView: customAnimationView)
    }
}

extension UIButton {

    override public func activityIndicator(activityIndicatorStyle: UIActivityIndicatorViewStyle) -> UIActivityIndicatorView {
        switch activityIndicatorStyle {
        case .White, .WhiteLarge:
            return UIActivityIndicatorView(color: UIColor(red: 242/255.0, green: 247/255.0, blue: 250/255.0, alpha: 1.0))
        case .Gray:
            return UIActivityIndicatorView(color: UIColor(red: 40/255.0, green: 61/255.0, blue: 77/255.0, alpha: 1.0))
        }
    }

}