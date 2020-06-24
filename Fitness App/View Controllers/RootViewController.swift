//
//  ViewController.swift
//  Fitness App
//
//  Created by Hayden Morgan on 6/23/20.
//  Copyright © 2020 Hayden Morgan. All rights reserved.
//

import CoreData
import UIKit

class RootViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Changed back to this method
    override func viewDidAppear(_ animated: Bool) {
        setup()
    }
    
    func setup() {
        
        var fetchResult: [User] = []
        do {
            // Look for User entities in Core Data
            fetchResult = try context.fetch(User.fetchRequest()) as! [User]
        } catch {
            fatalError("Fetch error")
        }

        //Modified this with single if conditions
        if fetchResult.count == 0 {
            // New user, calculate TDEE
            performSegue(withIdentifier: "toTDEE", sender: self)
        } else if fetchResult.count > 1 {
            // ERROR: Too many users
            fatalError("fetch count > 1")
        } else {
            //if fetchResult.count == 1
            if let user = fetchResult.first { // New Edit Here
                if !user.didFinishSetup {
                    // Didn't finish setup, re-calculate TDEE
                    performSegue(withIdentifier: "toTDEE", sender: self)
                }
            }
        }
    }
}

