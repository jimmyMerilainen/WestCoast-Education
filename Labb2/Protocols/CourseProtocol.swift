//
//  CourseProtocol.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-02.
//

import Foundation

enum StatusEnum: String {
    case null = "null"
    case Completed = "Completed"
    case Buy = "Buy"
}

protocol CoursProtocol {
    var courseName: String { get set }
    var courseInfo: String { get set }
    var status: StatusEnum { get set }
    var addedToFav: Bool { get set }
    var interested: Bool { get set }
}
