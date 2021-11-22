//
//  NoViewController.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/16/21.
//

import UIKit

class NoViewController: UIViewController {
    
    let userDefaults = UserDefaults()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageData: UIImageView!
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var pictureDescriptionText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "You Picked No"
        
        if let value = userDefaults.value(forKey: "response") as? String {
            pictureDescriptionText.text = value
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let description = pictureDescriptionText.text
        userDefaults.setValue(description, forKey: "response")
    }
    
}

extension NoViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            pictureDescriptionText.resignFirstResponder()
            return false
        }
        return true
    }
}

