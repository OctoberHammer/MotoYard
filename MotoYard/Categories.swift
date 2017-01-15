//
//  Categories.swift
//  MotoYard
//
//  Created by October Hammer on 1/11/17.
//  Copyright © 2017 Ocotober Hammer. All rights reserved.
//

import Foundation
import Parse


class Categories: PFObject {

	
	func getAllItems() {

		let query = PFQuery(className: "Categories")
		query.findObjectsInBackground {(objects: [PFObject]?, error: Error?) in
			if error == nil {
    // The find succeeded.
				print("Successfully retrieved \(objects!.count) scores.")
				// Do something with the found objects
				if let objects = objects {
//
				}
			} else {
				// Log details of the failure
				//print("Error: \(error!) \(error!.userInfo)")
			}
		}
	}
	
}

//// 1
//let query = PFQuery(className: "Categories")
//// 2
//query.whereKey("Name", equalTo: "John")
//query.whereKey("Score", greaterThan: 1000)
//// 3
//query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//	if error == nil {
//		println("Successfully retrieved: \(objects)")
//	} else {
//		println("Error: \(error) \(error.userInfo!)")
//	}
//}
//var categories: Array<PFObject> = []
