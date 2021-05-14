//
//  AllCourses+CoreDataProperties.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-17.
//
//

import Foundation
import CoreData


extension AllCourses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AllCourses> {
        return NSFetchRequest<AllCourses>(entityName: "AllCourses")
    }

    @NSManaged public var courseName: String?
    @NSManaged public var courseInfo: String?
    @NSManaged public var status: String?
    @NSManaged public var addedToFav: Bool
    @NSManaged public var interested: Bool

}

extension AllCourses : Identifiable {

}
