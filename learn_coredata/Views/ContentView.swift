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
        self.contentVM = ContentViewModel()
    }
    var body: some View {
        NavigationView{
            VStack{
                TextField("Task name", text: self.$contentVM.name)
                Button(action:{
                    self.contentVM.addTask()
                }){
                    Text("Add task")
                }
                Spacer()
                List{
                    ForEach(self.contentVM.tasks, id: \.name){ task in
                        NavigationLink(destination: EditTask(task: task)){
                            Text(task.name)
                        }
                    }
                    .onDelete { (IndexSet) in
                        self.contentVM.deleteTask(name: self.contentVM.tasks[IndexSet.first!].name)
                    }
                    
                }
            }
        }
    }
}

struct EditTask : View {
    @ObservedObject var contentVM = ContentViewModel()
     @Environment(\.presentationMode) var presentationMode
    @State var editValue = ""
    var task :  TaskModel
    var body : some View{
        
        VStack{
            TextField("", text: $editValue)
                .padding()
            Button(action:{
                self.contentVM.update(name: self.task.name, value: self.editValue)
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Save")
            }
        }
        .onAppear{
            self.editValue = self.task.name
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
