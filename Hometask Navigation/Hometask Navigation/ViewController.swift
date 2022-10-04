//
//  ViewController.swift
//  Hometask Navigation
//
//  Created by Yuliya Lapenak on 10/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.placeholder = "Name"
        surnameTextField.placeholder = "Surname"
        birthdayTextField.placeholder = "Date of birth"
        
        createDatePicker()
    }

    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        birthdayTextField.inputView = datePicker
        birthdayTextField.inputAccessoryView = createToolBar()
    }
    
    func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil , action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.birthdayTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }
}

