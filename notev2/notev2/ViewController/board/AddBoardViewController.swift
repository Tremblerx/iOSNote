//
//  AddBoardViewController.swift
//  notev2
//
//  Created by MAC10 on 2018/12/23.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit

class AddBoardViewController: UIViewController {

    @IBAction func saveBtn(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var drawBtn: UIButton!
    
    @IBOutlet weak var eraseBtn: UIButton!
    
    @IBOutlet weak var clearBtn: UIButton!
    
    
    @IBOutlet weak var drawingView: QLDrawView!
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBtn.setTitleColor(UIColor.red, for: .selected)
        eraseBtn.setTitleColor(UIColor.red, for: .selected)
    }
    
    @IBAction func draw(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        drawingView.drawMode = sender.isSelected ? .draw : .none
        eraseBtn.isSelected = false
    }
    
    
    @IBAction func erase(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        drawingView.drawMode = sender.isSelected ? .earse : .none
        drawBtn.isSelected = false
    }
    
    @IBAction func clear(_ sender: UIButton) {
        drawingView.clearScreen()
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
