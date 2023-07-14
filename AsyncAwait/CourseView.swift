//
//  CourseView.swift
//  AsyncAwait
//
//  Created by Dilshad N on 08/08/22.
//

import SwiftUI

struct CourseView: View {
    
    let course: Course
    
    var body: some View {
        VStack(alignment: .leading) {
            let url = URL(string: course.imageURL)
            AsyncImage(url: url) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            Text(course.name)
                .bold()
                .font(.headline)
            Text("Number od lessons : \(course.numberOfLessons)")
                .font(.subheadline)
            Text(course.link)
                .font(.footnote)
            
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: .sample)
    }
}
