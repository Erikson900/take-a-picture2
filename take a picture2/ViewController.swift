//
//  ViewController.swift
//  take a picture2
//
//  Created by Erik Ostrovski on 24/08/2021.
//
import MapKit
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {


    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var TPbutton: UIButton!
    @IBOutlet weak var Sbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.backgroundColor = .systemGray
        Sbutton.backgroundColor = .cyan
        TPbutton.backgroundColor = .magenta
    }

    @IBAction func button(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if let pickedImage = info[.originalImage] as? UIImage {
            myImage.contentMode = .scaleToFill
            myImage.image = pickedImage
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sharePic(_ sender: UIButton) {
        if CheckInternet.Connection(){
        
        guard let image = UIImage(systemName: "Pic"), let url = URL(string: "http://www.google.com") else {
            return
        }
        let shareSheetVc = UIActivityViewController(activityItems: [
        image,
        url
        ],
        applicationActivities: nil)
            present(shareSheetVc, animated: true) } else {
                self.Alert(Message: "Your Device is not connected to WIFI")
            }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if CheckInternet.Connection(){
            
            self.Alert(Message: "WIFI Connected")
            
        }else{
            self.Alert(Message: "Your Device is not connected to WIFI")
        }
    }
    
    func Alert(Message:String) {
        let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


