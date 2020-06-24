//
//  SetupViewController.swift
//  Fitness App
//
//  Created by Hayden Morgan on 6/23/20.
//  Copyright © 2020 Hayden Morgan. All rights reserved.
//

import CoreData
import UIKit

class TDEEViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
        let user = NSManagedObject(entity: entity, insertInto: context)
        user.setValue(true, forKey: "didFinishSetup")
        
        do {
            try context.save()
        } catch {
            fatalError("Couldn't save the context: \(error)")
        }
        navigationController!.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
