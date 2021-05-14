//
//  FavoriteCourse+CoreDataProperties.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-15.
//
//

import Foundation
import CoreData


extension FavoriteCourse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteCourse> {
        return NSFetchRequest<FavoriteCourse>(entityName: "FavoriteCourse")
    }

    @NSManaged public var courseInfo: String?
    @NSManaged public var courseName: String?
    @NSManaged public var status: String?
    @NSManaged public var addedToFav: Bool
    @NSManaged public var interested: Bool

}

extension FavoriteCourse : Identifiable {

}
