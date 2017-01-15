//
//  ViewController.swift
//  MotoYard
//
//  Created by October Hammer on 1/11/17.
//  Copyright © 2017 Ocotober Hammer. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		print("gjhgjgjhgjhgjkhgjhghjghjgjhghjgjhgjhgjhghjghj")
		let query = PFQuery(className: "Categories")
		var cats = query.countObjectsInBackground()
		let aCat = PFObject(className: "Categories")
		
//		let testObject = PFObject(className: "TestObject")
//		testObject["foo"] = "bar"
//		testObject.saveInBackground { (success: Bool, error: Error?) -> Void in
//			print("Object has been saved.")
//		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

