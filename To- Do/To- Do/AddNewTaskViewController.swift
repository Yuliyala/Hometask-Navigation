//
//  AddNewTaskViewController.swift
//  To- Do
//
//  Created by Yuliya Lapenak on 10/6/22.
//

import UIKit

class AddNewTaskViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var detailTextField: UITextField!
    
    
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
        navigationController?.popViewController(animated: true)
    }
    
}
