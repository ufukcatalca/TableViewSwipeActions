//
//  TableViewController.swift
//  SwipeActions
//
//  Created by Horizon on 18.10.2018.
//  Copyright © 2018 Horizon. All rights reserved.
//

import UIKit


class TasksTableViewController: UITableViewController {

    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...15 {
            tasks.append(Task(title: "Task #\(i)"))
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

 
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let important = importantAction(at: indexPath)
        let delete    = deleteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [delete,important])
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let complete = completeAction(at : indexPath)
        return UISwipeActionsConfiguration(actions: [complete])
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
    
        // Configure the cell ...
        let todo = tasks[indexPath.row]
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = todo.date.description
        
        return cell
    
    }
    
    
    func importantAction(at indexPath: IndexPath)-> UIContextualAction{
        
        let todo = tasks[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Significant"){
            (action,view,completion)in
            completion(true)
        }
        action.image = UIImage(named: "alarm-clock")
        action.backgroundColor = todo.isSignificant ? .purple : .gray
        
        return action
    }
    
    func deleteAction(at indexPath:IndexPath)-> UIContextualAction{
        
        let action = UIContextualAction(style: .normal, title: "Erase"){
            (action,view,completion)in
            
            self.tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        action.image = UIImage(named: "delete")
        action.backgroundColor = .red
        
        return action
    }

    func completeAction(at indexPath : IndexPath) -> UIContextualAction{
        
        let action = UIContextualAction(style: .destructive, title: "Complete") {
            (action,view,completion) in
            
            self.tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.image = UIImage(named: "check")
        action.backgroundColor = .orange
        
        return action
    }
   
}
