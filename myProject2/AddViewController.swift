//
//  ViewController.swift
//  myProject2
//
//  Created by Haya on 25/03/1443 AH.
//

import UIKit

class AddViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var FlowerModel : Store!
    var selectedFlowerIndex : Int!

    @IBOutlet weak var updateButtonOutlet: UIButton!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var Addimag: UIImageView!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var informations: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateButtonOutlet.isHidden = true

        if (selectedFlowerIndex != nil) {
            print(selectedFlowerIndex)
            Name.text = FlowerModel.products[selectedFlowerIndex].title
            informations.text = FlowerModel.products[selectedFlowerIndex].info
            updateButtonOutlet.isHidden = false
            saveButtonOutlet.isHidden = true

        }
    }
    @IBAction func Save(_ sender: Any) {
        FlowerModel.products.append(Flower(title: Name.text!, info: informations.text!, photo:Addimag.image))
        
        navigationController?.popViewController(animated: true)
        
            }
    @IBAction func updateButton(_ sender: Any) {
        FlowerModel.products[selectedFlowerIndex] = Flower(title: Name.text!, info: informations.text!)
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func Add(_ sender: Any) {
        showpohto()
  }
    func showpohto(){
        let alert = UIAlertController(title: "Take photo From ", message: " Thanks For adding ", preferredStyle: .actionSheet)
        
        
        
        alert.addAction(UIAlertAction(title: "photo library", style: .default , handler: {action in
            self.getPhoto(type: .photoLibrary)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
   }
    
    func getPhoto(type:UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true, completion: nil)
       
        guard let image = info[.originalImage] as? UIImage else{
            print ("image not found")
            return
        }
        Addimag.image = image
        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

