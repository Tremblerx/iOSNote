//
//  NoteDetailViewController.swift
//  notev2
//
//  Created by MAC10 on 2018/11/6.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit
import CoreData

class NoteDetailViewController: UIViewController {

    
    var data:NSManagedObject!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var contentNote: UITextView!
    @IBOutlet weak var titleNote: UITextField!
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        data.setValue(titleNote.text, forKey: "title")
        data.setValue(contentNote.text, forKey: "content")
        data.setValue(Date(), forKey: "date")
        do{
            try data.managedObjectContext?.save()
        }catch{
            print("更新文本出错")
        }
        backAction((Any).self)
    }
    
    @IBAction func canBtn(_ sender: Any) {
        backAction((Any).self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        titleNote.text = data.value(forKey: "title") as? String
        contentNote.text = data.value(forKey: "content") as? String
        let date = data.value(forKey:"date") as? NSDate
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
       label1.text = dateformatter.string(from: date! as Date) as String
        
        //contentNote.keyboardType = UIKeyboardType.default
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
