//
//  StartProtocol.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-17.
//

import Foundation

protocol StartProtocol {
    var AllCoursesArray: [[CourseModel]] { get set }
    
    func getCourses() -> [[CourseModel]]
}
