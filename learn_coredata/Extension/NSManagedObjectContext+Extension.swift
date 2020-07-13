//
//  NSManagedObjectContext+Extension.swift
//  learn_coredata
//
//  Created by tientran on 7/13/20.
//  Copyright © 2020 tientran. All rights reserved.
//

import SwiftUI
import CoreData

extension NSManagedObjectContext {
    static var currentContext : NSManagedObjectContext{
        let appDelegte = UIApplication.shared.delegate as! AppDelegate
        return appDelegte.persistentContainer.viewContext
    }
  
}
