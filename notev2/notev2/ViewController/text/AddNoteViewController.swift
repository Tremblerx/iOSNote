//
//  AddNoteViewController.swift
//  notev2
//
//  Created by MAC10 on 2018/11/6.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit
import CoreData

class AddNoteViewController:UIViewController {
    @IBOutlet weak var titleNote: UITextField!
    
    @IBOutlet weak var textNote: UITextView!
    
    @IBAction func saveData(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        //获取上下文
        
        let row:AnyObject = NSEntityDescription.insertNewObject(forEntityName: "TextNote", into:context)
        row.setValue(titleNote.text, forKey: "title")
        row.setValue(textNote.text, forKey: "content")
        row.setValue(Date(), forKey: "date")
        do {
            try
                context.save()
                self.saveAlert(title: "提示",message: "保存成功")
        } catch  {
            print("添加文本笔记失败")
            self.saveAlert(title: "提示",message: "保存失败")
            
        }
        
    }
    @IBAction func backMain(_ sender: Any) {
        print("我要回去啊")
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func saveAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction.init(title: "确定", style: .default){(oneAction) in
            print("标题:",self.titleNote.text ?? "error")
            print("内容:\(String(describing: self.textNote.text))")
            self.dismiss(animated: true, completion: nil)
            }
        alert.addAction(okAction)
        self.present(alert,animated: true,completion: nil)
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
