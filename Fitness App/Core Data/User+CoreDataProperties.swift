//
//  User+CoreDataProperties.swift
//  Fitness App
//
//  Created by Hayden Morgan on 6/23/20.
//  Copyright © 2020 Hayden Morgan. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var didFinishSetup: Bool

}
