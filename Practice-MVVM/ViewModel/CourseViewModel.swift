//
//  CourseViewModel.swift
//  Practice-MVVM
//
//  Created by Gerson Janhuel on 27/08/20.
//

import Foundation

class CourseViewModel {
    let id: Int
    let name: String
    let numberOfLessons: String
    
    init(course: Course) {
        // logic of the Presentation layer is here
        
        id = course.id
        name = course.name
        
        if course.number_of_lessons > 35 {
            numberOfLessons = "Number of lessons: 35+"
        } else {
            numberOfLessons = "Number of lessons: \(course.number_of_lessons)"
        }
        
        // you can do another logic here e.g. date formating etc 
    }
    
    
}
