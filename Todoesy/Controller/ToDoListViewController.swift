//
//  ViewController.swift
//  Todoesy
//
//  Created by Kumar, Vimal on 20/11/18.
//  Copyright © 2018 Kumar, Vimal. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var myList = [Item]()
    
    var  filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
   // var userDefault = UserDefaults.standard

    @IBAction func addButtonPressed(_ sender: Any) {
        var uitextField = UITextField()
        let alertController = UIAlertController(title: "Enter the task", message: " ", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add Item", style: .default) { (alertAction) in
            let item = Item()
            item.name = uitextField.text!
            self.myList.append(item)
            self.saveItems()
            self.tableView.reloadData()
            //self.userDefault.setValue(self.myList, forKey: "Vimalsitem")
        }
        alertController.addAction(alertAction)
        alertController.addTextField { (textField) in
            uitextField = textField
        }
        
        present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // print(filePath)
        loadItems()
//        if let st = self.userDefault.value(forKey: "Vimalsitem") as? [Item] {
//            myList = st
//        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath)
        let ite = myList[indexPath.row]
        viewCell.textLabel?.text = ite.name
        viewCell.accessoryType = ite.status ? .checkmark : .none
        return viewCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       myList[indexPath.row].status = !myList[indexPath.row].status
       saveItems()
       tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data  = try encoder.encode(myList)
            try data.write(to:filePath!)
        } catch {
            print("Error in encoding")
        }
        tableView.reloadData()
    }
    
    
    func loadItems() {
        
        
            if let data = try? Data(contentsOf: filePath!) {
                let dec = PropertyListDecoder()
                do {
                    myList = try dec.decode([Item].self, from: data)
                }
                catch {
                    print("error")
                }
                
            }
    }
}

