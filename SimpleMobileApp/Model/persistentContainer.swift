//
//  persistentContainer.swift
//  SimpleMobileApp
//
//  Created by Gokul on 12/31/20.
//

import UIKit
import CoreData

func save(_ task_name: String,_ task_date_time: String, task_date_description: String ) {
    guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    // 1
    let managedContext =
        appDelegate.persistentContainer.viewContext
    // 2
    let task_Entity =
        NSEntityDescription.entity(forEntityName: "Task",
                                   in: managedContext)!
    let task_Object = NSManagedObject(entity: task_Entity,
                                      insertInto: managedContext)
    // 3
    task_Object.setValue(task_name, forKeyPath: "task_Name")
    task_Object.setValue(task_date_time, forKeyPath: "task_date_time")
    task_Object.setValue(task_date_description, forKeyPath: "task_description")
    // 4
    do {
        try managedContext.save()        
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}


func retrieve_data(){
    guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    // 1
    let managedContext =
        appDelegate.persistentContainer.viewContext
    //2
    let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Task")
    //3
    do {
        taskSingleton.shared.staticData.removeAll()
        let people = try managedContext.fetch(fetchRequest)
        _ = people.map {  taskSingleton.shared.staticData.append(taskModel(task_name: $0.value(forKey: "task_Name") as? String, task_date_time: $0.value(forKey: "task_date_time")as? String, task_description: $0.value(forKey: "task_description") as? String ))   }
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
}
