//
//  AddAudioViewController.swift
//  notev2
//
//  Created by MAC10 on 2018/12/23.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit


class AddAudioViewController: UIViewController {

    
    @IBOutlet weak var titleAudio: UITextField!
    
    
    let recorder = RecordManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startBtn(_ sender: Any) {
        recorder.beginRecord()
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        recorder.stopRecord()
    }
    
    
    @IBAction func playBtn(_ sender: Any) {
        let url = recorder.getUrl();
        recorder.play(filePath: url)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let path = recorder.getUrl().path
      
        let title = titleAudio.text ?? "暂无标题"
        
        if( SaveData.saveAudio(title:title,path: path, date: Date()) == true)
          {
           SmallTools.tcAlert(title: "提示", message: "保存成功",ob:self)
           
        }
        else
          {
            return
        }
       
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
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
