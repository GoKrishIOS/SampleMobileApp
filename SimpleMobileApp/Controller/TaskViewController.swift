//
//  TaskViewController.swift
//  SimpleMobileApp
//
//  Created by Gokul on 12/30/20.
//

import UIKit
import TTGSnackbar
import CoreData

class TaskViewController: UIViewController {
    
    @IBOutlet weak var taskTable: UITableView!
    @IBOutlet weak var menuContainer: UIView!
    
    var selectedDate = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        menuContainer.layer.applyCornerRadiusShadow(color: UIColor.lightGray.withAlphaComponent(0.7),
                                                          alpha: 0.38,
                                                          x: 0, y: 3,
                                                          blur: 10,
                                                          spread: 0,
                                                          cornerRadiusValue: 15)
        
        taskTable.register(UINib(nibName: "TaskTableCell", bundle: .main), forCellReuseIdentifier: "TaskTableCell")
        taskTable.dataSource = self
        taskTable.delegate = self
        taskTable.tableFooterView = UIView()
        taskTable.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        // Do hideKeyboardany additional setup after loading the view.
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}
extension TaskViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableCell", for: indexPath) as? TaskTableCell {
            cell.date_feild.text = selectedDate
            cell.timePicker.addTarget(self, action: #selector(getTime), for: .valueChanged)
            cell.saveBtn.mk_addTapHandler { (action) in
                let taskname = cell.task_name.text ?? ""
                let task_date = cell.date_feild.text ?? ""
                let task_time = cell.time_feild.text ?? ""
                let task_desc = cell.task_desc.text ?? ""
                
                if taskname.count != 0 && task_date.count != 0 && task_desc.count != 0, task_time.count != 0 {
                    taskSingleton.shared.storeCoreData(task_name: taskname, task_date_time: task_date+" "+task_time, task_description: task_desc)
                    self.dismiss(animated: true) {
                        NotificationCenter.default.post(name: NSNotification.Name("UpdateTable"), object: nil)
                    }
                }else{
                    let snackbar = TTGSnackbar(
                        message: "Please fill the data",
                        duration: .middle
                    )
                    snackbar.show()

                }
            }
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    @objc func getTime(picker: UIDatePicker){
        guard let cell = taskTable.cellForRow(at: IndexPath(row: 0, section: 0)) as? TaskTableCell else { return }
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let time = formatter.string(from: picker.date)
        cell.time_feild.text = time
    }
}
