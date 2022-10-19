//
//  AddNewTaskViewController.swift
//  To- Do
//
//  Created by Yuliya Lapenak on 10/6/22.
//

import UIKit

protocol AddNewTaskViewControllerDelegate: AnyObject {
    func addTasks(task: Tasks)
    
}

class AddNewTaskViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    
    weak var delegate: AddNewTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupTextField(textField: titleTextField)
        setupTextField(textField: detailTextField)
    }
    
    func setupTextField (textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 2
        textField.layer.masksToBounds = true
  
    }
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
        var task: Tasks?
        if let title = titleTextField.text, title.count > 0,
           let detail = detailTextField.text, detail.count > 0 {
            task = Tasks(title: title, detail: detail, isDone: false)
        }

        delegate?.addTasks(task: task!)
        navigationController?.popViewController(animated: true)
    }
    
}
