//
//  CoreDataManager.swift
//  learn_coredata
//
//  Created by tientran on 7/12/20.
//  Copyright © 2020 tientran. All rights reserved.
//

import SwiftUI
import CoreData

class CoreDataManager {
    
    static var shareMoc = CoreDataManager(moc: NSManagedObjectContext.currentContext)
    
    var moc : NSManagedObjectContext
    private init(moc: NSManagedObjectContext){
        self.moc = moc
    }
    
    func fetchTaskByName(name : String) -> Task? {
        var task = [Task]()
        let taskRequest : NSFetchRequest<Task> = Task.fetchRequest()
        taskRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            task = try self.moc.fetch(taskRequest)
        } catch let err  as NSError {
            print(err)
        }
        return task.first
    }
    
    func removeTask(name: String) {
        do {
            if let order = fetchTaskByName(name: name){
                self.moc.delete(order)
                try self.moc.save()
            }
        } catch let err as NSError {
            print(err)
        }
    }
    
    func addtask(name : String) {
        let task = Task(context: self.moc)
        task.name = name
        
        do {
            try self.moc.save()
        } catch {
            print(error)
        }
    }
    
    func getAllTasks() -> [Task] {
        
        var orders = [Task]()
        
        let orderRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            orders = try self.moc.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return orders
        
    }
    
    //    func fetchAllTask() -> [Task] {
    //        var tasks =  [Task]()
    //        let taskRequest :  NSFetchRequest<Task> = Task.fetchRequest()
    //
    //        do {
    //            tasks = try self.moc.fetch(taskRequest)
    //        } catch let err as NSError {
    //            print(err)
    //        }
    //        return tasks
    //
    //    }
    
}

