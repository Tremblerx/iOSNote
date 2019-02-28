//
//  SaveData.swift
//  notev2
//
//  Created by MAC10 on 2018/12/23.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit
import CoreData
class SaveData: NSObject {
    
   
    static func getContext()-> NSManagedObjectContext{
        let context = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        //获取上下文
        return context
    }
    
   static func saveAudio(title:String,path:String,date:Date) -> Bool {
    print("A2")
      let context = getContext();
        let row:AnyObject = NSEntityDescription.insertNewObject(forEntityName: "AudioNote", into:context)
    print("A3")
        row.setValue(title, forKey: "title")
        row.setValue(path, forKey: "path")
        row.setValue(date, forKey: "date")
        print("A4")
        do {
            try context.save()
             print("添加音频笔记成功")
            return true
        } catch  {
            print("添加音频笔记失败")
        }
        return false
    }
}
