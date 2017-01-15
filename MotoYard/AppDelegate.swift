//
//  AppDelegate.swift
//  MotoYard
//
//  Created by October Hammer on 1/11/17.
//  Copyright © 2017 Ocotober Hammer. All rights reserved.
//

import UIKit
import Parse
import Bolts
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let configuration = ParseClientConfiguration {
			$0.applicationId = "p2TQzhDW8UCtUD23wgoj3chpUQ6YrqFQSY75uxHa"
			$0.clientKey = "Kdr8SBsp36w1snMsHaO9dGP8C5Rw7zy5HqRKt17P"
			$0.server = "https://parseapi.back4app.com"
		}
		Parse.initialize(with: configuration)
		
		PFUser.enableAutomaticUser()
		
		let defaultACL = PFACL()
		
		// If you would like all objects to be private by default, remove this line.
		defaultACL.getPublicReadAccess = true
		
		PFACL.setDefault(defaultACL, withAccessForCurrentUser: true)
//		if application.applicationState != UIApplicationState.background {
//			// Track an app open here if we launch with a push, unless
//			// "content_available" was used to trigger a background push (introduced in iOS 7).
//			// In that case, we skip tracking here to avoid double counting the app-open.
//			
//			let oldPushHandlerOnly = !responds(to: #selector(UIApplicationDelegate.application(_:didReceiveRemoteNotification:fetchCompletionHandler:)))
//			var noPushPayload = false
//			if let options = launchOptions {
//				noPushPayload = options[UIApplicationLaunchOptionsKey.remoteNotification] == nil
//			}
//			if oldPushHandlerOnly || noPushPayload {
//				PFAnalytics.trackAppOpened(launchOptions: launchOptions)
//			}
//		}
//		
//
//		
////		let types: UNAuthorizationOptions = [.alert, .badge, .sound]
////		let settings = UNNotificationSetting(rawValue: Int(types.rawValue))
//		registerForPushNotifications(application: application)
////		application.registerUserNotificationSettings(settings)
////		application.registerForRemoteNotifications()
		return true
	}

	
	func registerForPushNotifications(application: UIApplication) {
		
		if #available(iOS 10.0, *){
			UNUserNotificationCenter.current().delegate = self
			UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert], completionHandler: {(granted, error) in
				if (granted)
				{
					UIApplication.shared.registerForRemoteNotifications()
				}
				else{
					//Do stuff if unsuccessful...
				}
			})
		}
			
		else{ //If user is not on iOS 10 use the old methods we've been using
			let types: UIUserNotificationType = [.alert, .badge, .sound]
			let settings = UIUserNotificationSettings(types: types, categories: nil)
			application.registerUserNotificationSettings(settings)
		}
		
	}
	
	
	
	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

