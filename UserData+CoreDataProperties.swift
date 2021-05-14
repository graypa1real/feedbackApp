//
//  UserData+CoreDataProperties.swift
//  Project1
//
//  Created by admin on 4/30/21.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var completed: NSObject?

}

extension UserData : Identifiable {

}
