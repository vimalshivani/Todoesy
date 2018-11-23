//
//  CategoryTableViewController.swift
//  Todoesy
//
//  Created by Kumar, Vimal on 22/11/18.
//  Copyright © 2018 Kumar, Vimal. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var  categories = [Category]()
    
    
    var rowCount : Int?
    
    let appContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath)
        
        tableViewCell.textLabel?.text = categories[indexPath.row].name
        
        return tableViewCell
        
        
    }
    
    

    @IBAction func addcategory(_ sender: Any) {
        
        var textField = UITextField()
        
        let alertController = UIAlertController(title: "Add Category", message: "", preferredStyle:.alert)
        
        
        let alertAction = UIAlertAction(title: "Add", style: .default) { (action) in
            
            
            let category = Category(context: self.appContext)
            
            category.name = textField.text!
            self.categories.append(category)
            self.saveItems()
            self.tableView.reloadData()
        }
        alertController.addAction(alertAction)
        
        alertController.addTextField { (uitextField) in
            textField = uitextField
        }
        
        present(alertController, animated: true, completion: nil)
        
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showTasks", sender: self)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
          controller.myCategory = categories[indexPath.row]
        }
        
        
    }
    
    func saveItems() {
        
        
        
        do {
            try appContext.save()
        }
        catch {
            print("Error is \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    func loadItems(request : NSFetchRequest<Category> = Category.fetchRequest())  {
        
        do {
            try categories = appContext.fetch(request)
        }
        catch {
            
        }
        
        tableView.reloadData()
        
    }
    
    
    
   

    

   

}
