//
//  PersonInfoViewController.swift
//  Hometask Navigation
//
//  Created by Yuliya Lapenak on 10/4/22.
//

import UIKit

class PersonInfoViewController: UIViewController {

    var person: Person!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = person.name
        surnameLabel.text = person.surname
        birthdayLabel.text = person.birthday
    }
}
