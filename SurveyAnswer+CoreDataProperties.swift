//
//  SurveyAnswer+CoreDataProperties.swift
//  Project1
//
//  Created by admin on 4/30/21.
//
//

import Foundation
import CoreData


extension SurveyAnswer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SurveyAnswer> {
        return NSFetchRequest<SurveyAnswer>(entityName: "SurveyAnswer")
    }

    @NSManaged public var name: String?
    @NSManaged public var numComp: Int16
    @NSManaged public var q1StarCount: NSObject?
    @NSManaged public var q2StarCount: NSObject?
    @NSManaged public var q3StarCount: NSObject?
    @NSManaged public var q4StarCount: NSObject?
    @NSManaged public var q5StarCount: NSObject?

}

extension SurveyAnswer : Identifiable {

}
