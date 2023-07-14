//
//  ContentView.swift
//  AsyncAwait
//
//  Created by Dilshad N on 07/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: ContentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                ScrollView {
                    if vm.isFetching {
                        ProgressView()
                    }
                    
                    LazyVStack(spacing: 20) {
                        ForEach(vm.courses) { course in
                            CourseView(course: course)
                            
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    
                }
                .navigationTitle("Courses")
                .task {
                    await vm.fetchData()
                }
                .navigationBarItems(trailing: refreshButton)
            }
        }
    }
    
    // Refresh button
    private var refreshButton: some View {
        Button(action: {
            Task.init {
                vm.courses.removeAll() // just to see the refresh
                await vm.fetchData()
            }
        }) {
            Image(systemName: "arrow.clockwise.circle")
                .foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
