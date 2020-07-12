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
            List{
                ForEach(self.contentVM.tasks, id: \.name){task in
                    HStack{
                        Text(task.name)
                        Spacer()
                        Button(action: {
                            self.contentVM.deleteTask(task)
                        }){
                            Text("Xoá")
                        }
                        .padding(.all,10)
                        .background(Color.red)
                        .foregroundColor(.white)
                    }
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
