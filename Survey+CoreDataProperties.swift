//
//  Survey+CoreDataProperties.swift
//  Project1
//
//  Created by admin on 4/30/21.
//
//

import Foundation
import CoreData


extension Survey {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Survey> {
        return NSFetchRequest<Survey>(entityName: "Survey")
    }

    @NSManaged public var name: String?
    @NSManaged public var q1: String?
    @NSManaged public var q2: String?
    @NSManaged public var q3: String?
    @NSManaged public var q5: String?
    @NSManaged public var q4: String?

}

extension Survey : Identifiable {

}
