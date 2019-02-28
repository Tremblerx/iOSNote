//
//  ImageNoteViewController.swift
//  notev2
//
//  Created by MAC10 on 2018/12/4.
//  Copyright © 2018年 MAC10. All rights reserved.
//

import UIKit
import CoreData

class ImageNoteViewController: ViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    var imagePicker:UIImagePickerController!
    
    @IBOutlet weak var imageTitle: UITextField!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageContent: UITextView!
    
    @IBOutlet weak var label1: UILabel!
    @IBAction func backBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
 
    
    @IBAction func addImage(_ sender: Any) {
        
        print("添加图片")
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            if(self.imagePicker == nil){
                self.imagePicker = UIImagePickerController()
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker,animated: true,completion: nil)
            }
            
        }else{
            print("照相机不可用")
            if(self.imagePicker == nil){
                self.imagePicker = UIImagePickerController()
            }
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker,animated: true,completion: nil)
        }
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
      //  let image = imageView.image
        let imageData = imageView.image!.pngData()! as NSData
       // print(image ?? "error")
    
        //testview.image = UIImage(data: imageData as Data)
        
        let context1 = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        print("context完毕")
        let row:AnyObject = NSEntityDescription.insertNewObject(forEntityName: "ImageNote", into: context1)
        row.setValue(imageTitle.text, forKey: "title")
        row.setValue(imageContent.text, forKey: "content")
        row.setValue(imageData, forKey: "image")
        row.setValue(Date(), forKey: "date")
        print("赋值完毕")
        do{
         try
            context1.save()
        }catch {
            print("照片存储错误")
        }
        backBtn(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.brown.cgColor
        
        imageContent.layer.cornerRadius=7
        imageContent.layer.masksToBounds = true
        imageContent.layer.borderWidth = 3
        imageContent.layer.borderColor=UIColor.gray.cgColor
        
        // Do any additional setup after loading the view.
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
