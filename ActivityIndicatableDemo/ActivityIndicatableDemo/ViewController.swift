//
//  ViewController.swift
//  ActivityIndicatableDemo
//
//  Created by Quentin Ribierre on 7/29/16.
//  Copyright © 2016 Prolific Interactive Corp. All rights reserved.
//

import UIKit
import ActivityIndicatable

internal final class ViewController: UIViewController {

    // MARK: IBOutlet properties.

    @IBOutlet weak private var lightBackgroundButton: UIButton!
    @IBOutlet weak private var darkBackgroundButton: UIButton!
    @IBOutlet weak private var backgroundView: UIView!

    // MARK: Properties.

    private var backgroundColorType: BackgroundColorType = .Light {
        didSet {
            updateView(backgroundColorType)
        }
    }

    // MARK: ViewController Lifecycle functions.

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        updateView(backgroundColorType)
    }

    // MARK: Private Functions.

    private func updateView(backgroundColorType: BackgroundColorType) {
        backgroundView.stopActivityIndicator()

        backgroundView.backgroundColor = backgroundColorType.randomColor()
        updateButtonsState(backgroundColorType)
        updateStatusBar(backgroundColorType)
        
        backgroundView.startActivityIndicator()
    }

    private func updateButtonsState(backgroundColorType: BackgroundColorType) {
        switch backgroundColorType {
        case .Light:
            darkBackgroundButton.stopActivityIndicator()
            lightBackgroundButton.startActivityIndicator()
        case .Dark:
            lightBackgroundButton.stopActivityIndicator()
            darkBackgroundButton.startActivityIndicator()
        }
    }

    private func updateStatusBar(backgroundColorType: BackgroundColorType) {
        switch backgroundColorType {
        case .Light:
            UIApplication.sharedApplication().statusBarStyle = .Default
        case .Dark:
            UIApplication.sharedApplication().statusBarStyle = .LightContent
        }
    }

    // MARK: IBAction functions.

    @IBAction private func lightBackgroundButtonTapped(sender: AnyObject) {
        backgroundColorType = .Light
    }

    @IBAction private func darkBackgroundButtonTapped(sender: AnyObject) {
        backgroundColorType = .Dark
    }
}

