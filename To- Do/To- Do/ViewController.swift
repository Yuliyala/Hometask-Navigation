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
//
//    init( title: String, detail: String) {
//        self.title = title
//    }
}

class ViewController: UIViewController, AddNewTaskViewControllerDelegate {
   

    var tasks: [[Tasks]] = [[],[]]
  
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
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
        tasksTableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: TaskCell.identifier)
        tasksTableView.rowHeight = 60
    }
    
    func addTasks(task: Tasks) {
        tasks[0].append(task)
        tasksTableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return tasks[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as? TaskCell else {
            return UITableViewCell()
        }
        cell.setup(task: tasks[indexPath.section][indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Pending"
        } else {
            return "Done"
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = tasks[indexPath.section][indexPath.row]
        task.isDone.toggle()
        tasks[indexPath.section].remove(at: indexPath.row)

        let newSection = indexPath.section == 0 ? 1 : 0
        tasks[newSection].append(task)

        tasksTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "delete") { _, _, completion in
            self.tasks[indexPath.section].remove(at: indexPath.row)
            self.tasksTableView.reloadData()
            completion(true)
        }
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}

