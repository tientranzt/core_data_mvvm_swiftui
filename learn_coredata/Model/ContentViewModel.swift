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
        fetchAllTask()
    }
    
    func addTask() {
        CoreDataManager.shareMoc.addtask(name: name)
        fetchAllTask()
        self.name = ""
    }
    
    func fetchAllTask()  {
        self.tasks =  CoreDataManager.shareMoc.getAllTasks().map(TaskModel.init)
    }
    
    func deleteTask(_ taskRemove : TaskModel) {
        CoreDataManager.shareMoc.removeTask(name: taskRemove.name)
        fetchAllTask()
    }
}

class TaskModel {
    var name = ""
    init(task : Task) {
        self.name = task.name!
    }
}




