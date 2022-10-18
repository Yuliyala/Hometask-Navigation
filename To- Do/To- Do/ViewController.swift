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

class ViewController: UIViewController, AddNewTaskViewControllerDelegate {
   

    var tasks: [Tasks] = []
  
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func addNewTask(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(withIdentifier: "AddNewTaskViewController") as? AddNewTaskViewController else {return}
        destination.delegate = self
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func setupTable() {
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        tasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tasksTableView.rowHeight = 60
    }
    func addTasks(task: Tasks) {
        tasks.append(task)
        tasksTableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
