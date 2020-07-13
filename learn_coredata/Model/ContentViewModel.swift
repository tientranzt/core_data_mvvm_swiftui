//
//  ContentViewModel.swift
//  learn_coredata
//
//  Created by tientran on 7/12/20.
//  Copyright © 2020 tientran. All rights reserved.
//

import SwiftUI
import CoreData
class ContentViewModel: ObservableObject {
    
    @Published var tasks =  [TaskModel]()
    var name : String = ""
    
    init() {
        fetchAllTask()
    }
    
    func fetchAllTask() {
        self.tasks = CoreDataManager.share.fetchAllTask().map(TaskModel.init)
    }
    
    func addTask() {
        CoreDataManager.share.addTask(name: name)
        fetchAllTask()
        self.name = ""
    }
    func update(name: String, value : String)  {
        CoreDataManager.share.updateTask(name: name, valueEdit: value)
        fetchAllTask()
    }
    func deleteTask(name : String) {
        CoreDataManager.share.deleteTask(name: name)
        fetchAllTask()
    }
    
}

class TaskModel {
    var name: String = ""
    init(task : Task) {
        self.name = task.name!
    }
    
}






