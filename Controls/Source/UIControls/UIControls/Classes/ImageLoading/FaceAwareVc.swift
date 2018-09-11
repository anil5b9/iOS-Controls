//
//  FaceAwareVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit

class FaceAwareVc: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imgSelection: UIImageView!
    @IBOutlet weak var imgSelected: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       let gesture = UITapGestureRecognizer(target: self, action: #selector(FaceAwareVc.imagePicked))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        self.imgSelection.addGestureRecognizer(gesture)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func imagePicked() {
        openCamera()
    }
    func openCamera()
    {
       let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true
            imagePicker.cameraDevice = .front
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // imageViewPic.contentMode = .scaleToFill
            imgSelection.image = pickedImage
            imgSelected.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

}
