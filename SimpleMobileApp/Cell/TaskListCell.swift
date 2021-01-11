//
//  TaskListCell.swift
//  SimpleMobileApp
//
//  Created by Gokul on 12/30/20.
//

import UIKit

class TaskListCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
