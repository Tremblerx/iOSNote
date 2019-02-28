//
//  UserTableViewController.swift
//  notev2
//
//  Created by MAC10 on 2018/11/20.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit
import CoreData

class UserTableViewController: UITableViewController {
    
    
    var dataArr:Array<AnyObject>! = []
    var context:NSManagedObjectContext!
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        
        refreshData()
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        
        let label = cell.viewWithTag(2) as! UILabel
        label.text = dataArr[indexPath.row].value(forKey:"title") as? String
        let label1 = cell.viewWithTag(3) as! UILabel
       let date = dataArr[indexPath.row].value(forKey:"date") as? NSDate
        let dateformatter = DateFormatter()
   dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        label1.text = dateformatter.string(from: date! as Date) as String

        return cell
    }
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print("我准备跳转了")
        let data = dataArr[indexPath.row] as! NSManagedObject
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NoteDetail") as! NoteDetailViewController
        vc.data = data
        present(vc, animated: true, completion: nil)
        //print("我已经回来了")
    }
    
    func refreshData(){
        let f = NSFetchRequest<NSFetchRequestResult>(entityName: "TextNote")
        do {
            try
                dataArr = context.fetch(f)
        } catch  {
            perror("error")
        }
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshData()
    }
    
   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(dataArr[indexPath.row] as! NSManagedObject)
            do{
                try context.save()
            }catch{
                print("数据删除错误")
            }
            
            refreshData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
