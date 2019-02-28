//
//  ImageTableViewController.swift
//  notev2
//
//  Created by MAC10 on 2018/12/11.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit
import CoreData

class ImageTableViewController: UITableViewController {

    var dataImage:Array<AnyObject>!=[]
    var context1:NSManagedObjectContext!
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
context1 = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        refreshData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataImage.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...

        let label = cell.viewWithTag(1) as! UILabel
        label.text = dataImage[indexPath.row].value(forKey: "title") as? String
        let imageView = cell.viewWithTag(2) as! UIImageView
        let imageData = dataImage[indexPath.row].value(forKey:"image") as! NSData
        imageView.image = UIImage(data: imageData as Data)
        
        let label1 = cell.viewWithTag(3) as! UILabel
        let date = dataImage[indexPath.row].value(forKey:"date") as? NSDate
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        label1.text = dateformatter.string(from: date! as Date) as String
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataImage[indexPath.row] as! NSManagedObject
        let vi = storyboard?.instantiateViewController(withIdentifier: "ImageContent") as! ImageContentViewController
        vi.data = data
        present(vi, animated: true, completion: nil)
        
    }
    
    func refreshData(){
        let f = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageNote")
        do {
            try
                dataImage = context1.fetch(f)
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
            // Delete the row from the data source
            context1.delete(dataImage[indexPath.row] as! NSManagedObject)
            do{
                try context1.save()
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
