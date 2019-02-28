//
//  AddAlert.swift
//  notev2
//
//  Created by MAC10 on 2018/12/11.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit
import EventKit

class AddAlert: UIViewController {

    @IBOutlet weak var alertTitle: UITextField!
    
    @IBOutlet weak var alertLocation: UITextField!
    
    @IBOutlet weak var alertOther: UITextField!
    
 
    @IBOutlet weak var allDaySwitch: UISwitch!
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    
    
    @IBOutlet weak var endPicker: UIDatePicker!
    
    @IBOutlet weak var tips: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tips.isHidden = true
         //print("提醒测试中。。。。。",allDaySwitch.isOn)
    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
       // print("switch h状态",allDaySwitch.isOn)
        
        let startDate = dataPicker.date as NSDate;
        let endDate = endPicker.date as NSDate;
        if(startDate as Date == startDate.laterDate(endDate as Date))
        {
            tips.isHidden = false
            return
        }
        
        let eventStore = EKEventStore()
        //（2）、授权访问日历：
        eventStore.requestAccess(to: .event) { (result, erro) in }
        
        //（3）、编辑事件：
        let event = EKEvent(eventStore: eventStore)
        // 事件名称
        event.title = alertTitle.text ?? "提醒" // 事件名称
        event.notes = alertOther.text ?? "备注" // 事件备注
        
        // 事件地点
        event.location = alertLocation.text ?? "河南大学"
        
        // 这个设置为true 开始结束时间就不会显示
        event.isAllDay = allDaySwitch.isOn
        
        // 开始时间
        let addDate = (dataPicker.date as NSDate).laterDate(Date())
        
        event.startDate = addDate
        
        // 结束时间
        event.endDate = endPicker.date
        
        event.addAlarm(EKAlarm(relativeOffset: -60*15)) // 设置提醒
        
        // 必须设置：系统的日历
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        //（4）、添加事件：
        do {
            let _ = try eventStore.save(event, span: .thisEvent)
            
        } catch {
            print(error)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
