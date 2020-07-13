//
//  CoreDataManager.swift
//  learn_coredata
//
//  Created by tientran on 7/12/20.
//  Copyright © 2020 tientran. All rights reserved.
//

import SwiftUI
import CoreData
class CoreDataManager{
    static var share =  CoreDataManager(moc: NSManagedObjectContext.currentContext)
    
    var moc : NSManagedObjectContext
    init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func fetchTaskByName(name : String) -> Task? {
        var task = [Task]()
        let taskRequest :  NSFetchRequest<Task> =  Task.fetchRequest()
        taskRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            task = try self.moc.fetch(taskRequest)
        } catch  {
            print(error)
        }
        return task.first!
    }
    
    func  addTask(name: String) {
        let task =  Task(context: self.moc)
        task.name = name
        do {
            try self.moc.save()
        } catch  {
            print(error)
        }
    }
    
    func updateTask(name: String, valueEdit : String)  {
        do {
            if let task = fetchTaskByName(name: name){
                task.setValue(valueEdit , forKey: "name")
                do {
                    try  self.moc.save()
                } catch  {
                    print(error)
                }
            }
        }
//        catch{
//            print(error)
//        }
    }
    
    
    
    func deleteTask(name: String) {
        do {
            if let task = fetchTaskByName(name: name){
                self.moc.delete(task)
                try self.moc.save()
            }
        } catch  {
            print(error)
        }
    }
    
    func fetchAllTask() -> [Task] {
        var task = [Task]()
        
        let taskRequest : NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            task = try self.moc.fetch(taskRequest)
        } catch let err as NSError {
            print(err)
        }
        return task
    }
    
}
