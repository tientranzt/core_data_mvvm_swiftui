//
//  ContentView.swift
//  learn_coredata
//
//  Created by tientran on 7/12/20.
//  Copyright © 2020 tientran. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var contentVM : ContentViewModel
    
    init() {
        contentVM = ContentViewModel()
    }
    var body: some View {
        VStack{
            TextField("Enter some task", text: self.$contentVM.name)
            Button(action: {
                self.contentVM.addTask()
            }){ Text("Add task")}
            Spacer()
            ScrollView{
                ForEach(self.contentVM.tasks, id: \.name){task in
                    HStack{
                        Text(task.name)
                        Spacer()
                        Button(action: {
                            self.contentVM.deleteTask(task)
                        }){
                            Text("Delete")
                        }
                        .padding(.all,10)
                        .background(Color.red)
                        .foregroundColor(.white)
                        
                        Button(action: {
                            self.contentVM.update(task: task)
                        }){
                            Text("Edit")
                        }
                        .padding(.all,10)
                        .background(Color.green)
                        .foregroundColor(.white)
                    }.padding()
                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
