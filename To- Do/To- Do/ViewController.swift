//
//  ViewController.swift
//  To- Do
//
//  Created by Yuliya Lapenak on 10/6/22.
//

import UIKit

struct Tasks {
    var title: String
    var detail: String
    var isDone: Bool
}

class ViewController: UIViewController {

    var tasks: [Tasks] = []
  
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tasksTableView.rowHeight = 60
    }

    
    @IBAction func addNewTask(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(withIdentifier: "AddNewTaskViewController") as? AddNewTaskViewController else {return}
        navigationController?.pushViewController(destination, animated: true)
    }
    
}
extension ViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    
}

