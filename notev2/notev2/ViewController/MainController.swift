//
//  MainController.swift
//  notev2
//
//  Created by MAC10 on 2018/11/6.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit
import CoreData

class MainController: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!
   
    
    @IBAction func allAudioBtn(_ sender: Any) {
         self.performSegue(withIdentifier: "allAudio",sender: self)
    }
    
    @IBAction func allNotesBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "allNotes",sender: self)
    }
    
    @IBAction func allImageBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "imageAll",sender: self)
    }
    
    
    @IBAction func textAction(_ sender: Any) {
        self.performSegue(withIdentifier: "addNote", sender: nil)
    }
    @IBAction func photoAction(_ sender: Any) {
        self.performSegue(withIdentifier: "addImageNote", sender: nil)
    }
    
    @IBAction func alertAction(_ sender: Any) {
        //print("alert被点击了")
        self.performSegue(withIdentifier: "AddAlert", sender: nil)
    }
    
    @IBAction func listAction(_ sender: Any) {
    //print("list被点击了")
        self.performSegue(withIdentifier: "AddAudio", sender: nil)
    }
    
    @IBAction func chatAction(_ sender: Any) {
        //print("chat被点击了")
        self.performSegue(withIdentifier: "AddBoard", sender: nil)
    }
    
    
    //导航栏点击事件
    
    @IBAction func setAction(_ sender: Any) {
    }
    @IBAction func refresh(_ sender: Any) {
    }
    
    @IBAction func search(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
}

