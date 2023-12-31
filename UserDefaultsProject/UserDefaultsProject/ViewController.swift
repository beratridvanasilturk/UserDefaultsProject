//
//  ViewController.swift
//  UserDefaultsProject
//
//  Created by Berat Rıdvan Asiltürk on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedAge = UserDefaults.standard.object(forKey: "age")
        
        if let newName = storedName as? String {
            nameLbl.text = " Name: \(newName)"
        }
        if let newAge = storedAge as? String {
            ageLbl.text = " Age: \(newAge)"
        }
        
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        
        UserDefaults.standard.set(ageTextField.text, forKey: "age")
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        
        nameLbl.text = "Name: \(nameTextField.text!)"
        ageLbl.text = "Age: \(ageTextField.text!)"
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedAge = UserDefaults.standard.object(forKey: "age")
        
        if storedName as? String != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLbl.text = "Name: "
        }
        
        if storedAge as? String != nil {
            UserDefaults.standard.removeObject(forKey: "age")
            ageLbl.text = "Age: "
        }
    }
    
}

