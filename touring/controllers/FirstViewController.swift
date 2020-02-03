//
//  FirstViewController.swift
//  touring
//
//  Created by Jaime Achircano on 2020-01-27.
//  Copyright © 2020 Jaime Achircano. All rights reserved.
//

import UIKit
import TLPhotoPicker

class FirstViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,TLPhotosPickerViewControllerDelegate {
    
    
    @IBOutlet weak var titleTF: UITextField!
    
    var selectedThumbnail = [TLPHAsset]()
    var selectedAssests = [TLPHAsset]()
    
    @IBOutlet weak var categoryTF: UITextField!
    
    let categorys = ["Hotels", "Malls"]
    let categoryPV = UIPickerView()
    
    @IBOutlet weak var descriptionTV: UITextView!
    
    @IBAction func thumbnailBtn(_ sender: UIButton) {
        
        let viewController = TLPhotosPickerViewController()
        
        viewController.configure.maxSelectedAssets = 1
        
        viewController.delegate = self
        
        viewController.selectedAssets = self.selectedThumbnail
                
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func imagesBtn(_ sender: UIButton) {
        
        let viewController = TLPhotosPickerViewController()
        
        viewController.delegate = self
        
        viewController.selectedAssets = self.selectedAssests
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        categoryTF.tag = 1
        categoryPV.tag = 1
        
        categoryPV.delegate = self
        categoryPV.dataSource = self
        
        descriptionTV.delegate = self
        descriptionTV.text = "Description"
        descriptionTV.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Description"
            textView.textColor = UIColor.lightGray
        }
    }
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return categorys.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return categorys[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            categoryTF.text = categorys [row]
        default:
            break
        }
        self.view.endEditing(false)
    }
}

