//
//  AppDelegate.swift
//  PXPHomeViewController
//
//  Created by Paris Pinkney on 12/29/15.
//  Copyright © 2015 PXPGraphics. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.

		let rootVC = HomeViewController()
		rootVC.view.backgroundColor = UIColor.whiteColor()

		let rootNavController = UINavigationController(rootViewController: rootVC)

		window = UIWindow(frame: UIScreen.mainScreen().bounds)
		window?.backgroundColor = UIColor.whiteColor()
		window?.rootViewController = rootNavController
		window?.makeKeyAndVisible()
		return true
	}

}
