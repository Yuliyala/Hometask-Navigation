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
    @IBOutlet weak var saveButton: UIButton!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func saveButtonPressed() {
        
        if checkTextField() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "PersonInfoViewController")
        guard let personInfoViewController = destination as? PersonInfoViewController else {
            return }
        personInfoViewController.person = Person(name: nameTextField.text ?? " ", surname: surnameTextField.text ?? "" , birthday: birthdayTextField.text ?? "" )
        navigationController?.pushViewController(destination, animated: true)
        } else {
            return
        }
    }
    func presentAlert(title: String, message: String, preferredStyle: UIAlertController.Style ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let action = UIAlertAction(title: "OK", style: .default) { action in
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkTextField() -> Bool {
        
        var name = ""
        var surname = ""
        var birthday = ""
        
        if let nameString = nameTextField.text, !nameString.isEmpty,
           let surnameString = surnameTextField.text, !surnameString.isEmpty,
           let birtdayString = birthdayTextField.text, !birtdayString.isEmpty {
            name = nameString
            surname = surnameString
            birthday = birtdayString
        }
        if name.count < 1 || surname.count < 1 || birthday.count < 1 {
            presentAlert(title: "Error", message: "Enter name , surname and date of birth ", preferredStyle: .alert)
        }
        return true
    }
    
    func setup() {
        nameTextField.placeholder = "Name"
        surnameTextField.placeholder = "Surname"
        birthdayTextField.placeholder = "Date of birth"
        setupTextFields(textField: nameTextField)
        setupTextFields(textField: surnameTextField)
        setupTextFields(textField: birthdayTextField)
        setupButton(button: saveButton)
        createDatePicker()
    }
    
    func setupTextFields (textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
    }
    
    func setupButton (button: UIButton) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
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

