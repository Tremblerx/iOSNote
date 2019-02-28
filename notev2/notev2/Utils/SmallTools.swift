//
//  SmallTools.swift
//  notev2
//
//  Created by MAC10 on 2018/12/23.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit

class SmallTools: NSObject {

    
    /// Date类型转化为日期字符串
    ///
    /// - Parameters:
    ///   - date: Date类型
    ///   - dateFormat: 格式化样式默认“yyyy-MM-dd”
    /// - Returns: 日期字符串
    static func dateConvertString(date:Date, dateFormat:String="yyyy年MM月dd日HH:mm:ss") -> String {
        print(date)
        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: date)
        return date.components(separatedBy: " ").first!
    }
    
    static func tcAlert(title:String,message:String,ob:Any){
        
        let alert = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction.init(title: "确定", style: .default){(oneAction) in
           print("保存成功即将返回")
           (ob as AnyObject).dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        (ob as AnyObject).present(alert,animated: true,completion: nil)
    }
    
    
    
    
    
}
