//
//  StartModel.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-17.
//

import Foundation
import UIKit

class StartModel: StartProtocol {
    
    var AllCoursesArray: [[CourseModel]] = [
        [CourseModel(courseName: "HTML och CSS", courseInfo: "Detta är en HTML och CSS kurs", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "Avancerad CSS", courseInfo: "Detta är en Avancerad CSS kurs", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "JavaScript för nybörjare", courseInfo: "Detta är en JavaScript kurs för nybörjare", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "Avancerad JavaScript och serverprogrammering", courseInfo: "Detta är en Avancerad JavaScript och serverprogrammeringskurs", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "JavaScript för webben", courseInfo: "Detta är en JavaScript kurs för webben", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "ASP.NET Core MVC", courseInfo: "Detta är en ASP.NET Core MVC kurs", status: .null, addedToFav: false, interested: false)],
        [CourseModel(courseName: "Introduktion till Android programmering", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "Avancerad Android programmering", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "iOS utveckling med Objective-C", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "iOS utveckling med Swift", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "Design och layout för mobila enheter", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false)],
        [CourseModel(courseName: "REST Api med node.js", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "Web Api med .NET Core", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false)],
        [CourseModel(courseName: "Administrera MS SQL Server", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "Databas design", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "Bygga system med MongoDB", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false),
         CourseModel(courseName: "Vad är ORM? Hur använder man ett sådant verktyg.", courseInfo: "Massa info, Massa info,Massa info", status: .null, addedToFav: false, interested: false)]
    ]
    
    func getCourses() -> [[CourseModel]] {
        return AllCoursesArray
    }
    
    
    
}
