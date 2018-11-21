//
//  ViewController.swift
//  Todoesy
//
//  Created by Kumar, Vimal on 20/11/18.
//  Copyright © 2018 Kumar, Vimal. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let myList = ["Shivani","Vimal","Kumar"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath)
        
        viewCell.textLabel?.text = myList[indexPath.row]
        
        return viewCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType ==  .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }


}

