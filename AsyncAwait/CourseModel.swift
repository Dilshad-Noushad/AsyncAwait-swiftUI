//
//  CourseModel.swift
//  AsyncAwait
//
//  Created by Dilshad N on 07/08/22.
//

import SwiftUI

struct Course: Codable, Identifiable {
    let id: Int
    let name: String
    let link, imageURL: String
    let numberOfLessons: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, link
        case imageURL = "imageUrl"
        case numberOfLessons
    }
}

extension Course {
    static var sample = Course(id: 10, name: "Introduction to swiftui", link: "https://finalspaceapi.com/docs/endpoints/episode/", imageURL: "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/194badd9-b719-495b-bc77-3737115a9524_medium", numberOfLessons: 12)
}
