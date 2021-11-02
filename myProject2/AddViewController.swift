//
//  ViewController.swift
//  myProject2
//
//  Created by Haya on 25/03/1443 AH.
//

import UIKit

class AddViewController: UIViewController {
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
}
