//
//  ViewController.swift
//  notev2
//
//  Created by MAC10 on 2018/11/6.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var tips: UILabel!
    
    @IBAction func btn1(_ sender: Any) {
        
        let name = phone.text
        let pwd = password.text
        if(name == "test" && pwd == "123456")
        {
        self.performSegue(withIdentifier: "main", sender: self)
        }
        else
        {
            tips.numberOfLines=0//必须有
            
            tips.textColor = UIColor.gray
            
            tips.textColor = UIColor.red
            
            tips.text = "用户名或密码错误！"
        }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

