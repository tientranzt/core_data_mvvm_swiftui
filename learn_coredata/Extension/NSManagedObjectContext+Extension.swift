//
//  NSManagedObjectContext+Extension.swift
//  learn_coredata
//
//  Created by tientran on 7/12/20.
//  Copyright © 2020 tientran. All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObjectContext {
//
    static var currentContext : NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}
