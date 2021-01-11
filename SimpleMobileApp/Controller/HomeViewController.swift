//
//  HomeViewController.swift
//  SimpleMobileApp
//
//  Created by Gokul on 12/30/20.
//

import UIKit
import FSCalendar


class HomeViewController: UIViewController {
    
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var calanderView: FSCalendar!
    @IBOutlet weak var taskTable: UITableView!
    fileprivate let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calanderView.allowsMultipleSelection = false
        calanderView.dataSource = self
        calanderView.delegate = self
        calanderView.select(Date())
        calanderView.appearance.todayColor = UIColor(red: 198/255.0, green: 51/255.0, blue: 42/255.0, alpha: 1.0)
        taskTable.delegate = self
        taskTable.dataSource = self
        navigationView.layer.applyCornerRadiusShadow(color: UIColor.lightGray.withAlphaComponent(0.7),
                                                     alpha: 0.38,
                                                     x: 0, y: 3,
                                                     blur: 10,
                                                     spread: 0,
                                                     cornerRadiusValue: 15)
        view.bringSubviewToFront(navigationView)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("UpdateTable"), object: nil, queue: .main) { [weak self]  (notification) in
            self?.taskTable.reloadData()
        }
    }
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if taskSingleton.shared.staticData.count != 0 {
            tableView.restore()
            return taskSingleton.shared.staticData.count
        }else{
            tableView.setEmptyView(title: "You don't have any task list", message: "Your task will be in here.")
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath) as? TaskListCell
        let data = taskSingleton.shared.staticData[indexPath.row]
        cell?.date.text = data.task_date_time
        cell?.desc.text = data.task_description
        cell?.taskName.text = data.task_name
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension HomeViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
        print(formatter.string(from: date))        
        let controller = AppStoryboard.Main.viewController(viewControllerClass: TaskViewController.self)
        controller.selectedDate = formatter.string(from: date)
        self.present(controller, animated: true, completion: nil)            
    }
    
}
