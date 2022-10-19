//
//  TaskCell.swift
//  To- Do
//
//  Created by Yuliya Lapenak on 10/10/22.
//

import UIKit

class TaskCell: UITableViewCell {

    static let identifier = "TaskCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var isDoneImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setup(task: Tasks) {
        titleLabel.text = task.title
        subtitleLabel.text = task.detail
        if task.isDone {
            isDoneImageView.image = UIImage(systemName: "checkmark")
        } else {
            isDoneImageView.image = nil
        }
    }
}
