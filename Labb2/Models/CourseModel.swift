//
//  CourseModel.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-02.
//

import Foundation

struct CourseModel: CoursProtocol {
    var courseName: String
    var courseInfo: String
    var status: StatusEnum
    var addedToFav: Bool
    var interested: Bool
    
    
    init(courseName: String, courseInfo: String, status: StatusEnum, addedToFav: Bool, interested: Bool) {
        self.courseName = courseName
        self.courseInfo = courseInfo
        self.status = status
        self.addedToFav = addedToFav
        self.interested = interested

    }
}
