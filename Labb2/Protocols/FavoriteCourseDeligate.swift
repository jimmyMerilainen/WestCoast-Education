//
//  FavoriteCourseDeligate.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-08.
//

import Foundation

protocol FavoriteCourseDeligate: class {
    func update(task: CourseModel, index: Int, index1: Int)
    func save(course: CourseModel)
}
