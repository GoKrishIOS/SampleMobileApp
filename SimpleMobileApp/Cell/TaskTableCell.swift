//
//  UITableViewCell.swift
//  SimpleMobileApp
//
//  Created by Gokul on 12/30/20.
//

import UIKit

class TaskTableCell: UITableViewCell {

    @IBOutlet weak var task_desc: UITextView!
    @IBOutlet weak var task_name: UITextField!
    @IBOutlet weak var date_feild: UITextField!
    @IBOutlet weak var time_feild: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var saveBtn: UIButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
    }
    
    func setup(){
        task_desc.layer.cornerRadius = 5
        task_desc.layer.masksToBounds = true
        task_desc.layer.borderWidth = 1.0
        task_desc.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        saveBtn.layer.borderWidth = 1.0
        saveBtn.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        saveBtn.layer.cornerRadius = 5
        saveBtn.layer.masksToBounds = true
    }
}
