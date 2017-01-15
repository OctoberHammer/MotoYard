//
//  ParseLayer.swift
//  MotoYard
//
//  Created by October Hammer on 1/12/17.
//  Copyright © 2017 Ocotober Hammer. All rights reserved.
//

import Foundation
import Parse

protocol CategoriesDelegate {
	var categories: [String:PFObject] {get set}
}

class ParseLayer {
	var categoriesDelegate: CategoriesDelegate?
	var categories: [String:PFObject] = [:]
	//class
	//let query = PFQuery(className: "Categories")
	func getAllCategories() {
		
		let query = PFQuery(className: "Categories")
		
		query.findObjectsInBackground {(objects: [PFObject]?, error: Error?) in
			if error == nil {
				// The find succeeded.
				print("Successfully retrieved \(objects!.count) scores.")
				// Do something with the found objects
				if let objects = objects, var categoriesDelegate = self.categoriesDelegate {
					for object in objects {
						categoriesDelegate.categories[object.objectId ?? ""] = object
					}
				}
			} else {
				// Log details of the failure
				//print("Error: \(error!) \(error!.userInfo)")
			}
		}
		
}
}
