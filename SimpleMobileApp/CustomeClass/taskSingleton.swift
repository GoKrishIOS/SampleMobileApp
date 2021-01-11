//
//  taskSingleton.swift
//  SimpleMobileApp
//
//  Created by Gokul on 12/30/20.
//

import UIKit
import CoreData

class taskSingleton {
    static let shared = taskSingleton()
    var staticData = [taskModel]()
    var people: [NSManagedObject] = []
    
    func storeCoreData(task_name: String, task_date_time: String, task_description: String){
        staticData.append(taskModel(task_name: task_name, task_date_time: task_date_time, task_description: task_description))
        save(task_name, task_date_time, task_date_description: task_description)
    }
    func retrive(){
        retrieve_data()
    }
}


