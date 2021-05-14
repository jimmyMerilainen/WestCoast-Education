//
//  AddFavoriteDeligate.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-11.
//

import Foundation

protocol AddFavoriteDeligate: class {
    func updateFavorite(task: CourseModel, index: Int)
}
