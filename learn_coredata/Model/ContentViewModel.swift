//
//  ContentViewModel.swift
//  learn_coredata
//
//  Created by tientran on 7/12/20.
//  Copyright © 2020 tientran. All rights reserved.
//

import Foundation

class  ContentViewModel: ObservableObject {
    @Published var tasks = [TaskModel]()
    var name : String = ""
    
    
    init() {
        print("init")
        fetchAllTask()
    }
    
    func addTask() {
        print("add task")
        CoreDataManager.shareMoc.addtask(name: name)
        fetchAllTask()
        self.name = ""
    }
    
    func fetchAllTask()  {
        print("fetch all")
        self.tasks =  CoreDataManager.shareMoc.getAllTasks().map(TaskModel.init)
    }
    
    func deleteTask(_ taskRemove : TaskModel) {
        print("delete")
        CoreDataManager.shareMoc.removeTask(name: taskRemove.name)
        fetchAllTask()
    }
    
    func update(task : TaskModel) {
        print("update")
        CoreDataManager.shareMoc.updateTask(name: task.name)
        fetchAllTask()
    }
}

class TaskModel {
    var name = ""
    init(task : Task) {
        self.name = task.name!
    }
}




