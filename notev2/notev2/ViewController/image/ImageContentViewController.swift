//
//  ImageContentViewController.swift
//  notev2
//
//  Created by MAC10 on 2018/12/11.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit
import CoreData

class ImageContentViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var imagePicker:UIImagePickerController!
    
    @IBOutlet weak var titleImage: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var contentImage: UITextView!
    
    @IBOutlet weak var label1: UILabel!
    
    var data:NSManagedObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleImage.text = data.value(forKey: "title") as? String
        let image = data.value(forKey: "image") as! NSData
        imageView.image = UIImage(data: image as Data)
        
        contentImage.text = data.value(forKey: "content") as? String
        
        let date = data.value(forKey:"date") as? NSDate
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        label1.text = dateformatter.string(from: date! as Date) as String
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        
        let imageData = imageView.image!.pngData()! as NSData
        data.setValue(titleImage.text, forKey: "title")
        data.setValue(contentImage.text, forKey: "content")
        data.setValue(imageData, forKey: "image")
        data.setValue(Date(), forKey: "date")
        do {
            try data.managedObjectContext?.save()
        } catch  {
            print("更新数据出错")
        }
        self.backBtn((Any).self)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
       self.backBtn((Any).self)
    }
    @IBAction func updateImage(_ sender: Any) {
        print("更新图片")
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            if(self.imagePicker == nil){
                self.imagePicker = UIImagePickerController()
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker,animated: true,completion: nil)
            }
            
        }else{
            print("相机不可用")
            if(self.imagePicker == nil){
                self.imagePicker = UIImagePickerController()
            }
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker,animated: true,completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ _picker:UIImagePickerController){
        self.imagePicker.delegate = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        self.imageView.image = originalImage
        self.imageView.contentMode = .scaleToFill
        self.imagePicker.delegate=nil
        self.dismiss(animated: true, completion: nil)
        
        
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
