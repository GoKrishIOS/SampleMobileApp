//
//  Model.swift
//  SimpleMobileApp
//
//  Created by Gokul on 12/30/20.
//

import Foundation


struct taskModel {
    var task_name: String?
    var task_date_time: String?
    var task_description: String?    
    init(task_name: String?, task_date_time: String?, task_description: String?) {
        self.task_name = task_name
        self.task_date_time = task_date_time
        self.task_description = task_description
    }
}
