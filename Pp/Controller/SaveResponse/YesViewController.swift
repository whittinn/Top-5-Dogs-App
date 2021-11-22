//
//  ViewController1.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/5/21.
//

import UIKit

class YesViewController: UIViewController {
    
    
    var pictures2 : [Response]?
    var imageUrl : String?
    
    let userDefaults = UserDefaults()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageData: UIImageView!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var responseText: UITextView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var textViewer: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "You Picked Yes"
        rating.isHidden = true
        responseText.delegate = self
        if let value = userDefaults.value(forKey: "response") as? String {
            responseText.text = value
            
        }
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let description = responseText.text
        userDefaults.setValue(description, forKey: "response")
    }
    
    
    @IBAction func oneButtonPressed(_ sender: Any) {
        
        oneButton.backgroundColor = .yellow
        rating.text = "\(1)"
        twoButton.isEnabled = false
        threeButton.isEnabled = false
        fourButton.isEnabled = false
        fiveButton.isEnabled = false
        rating.isHidden = false
        
        
    }
    
    @IBAction func twoButtonPressed(_ sender: Any) {
        
        twoButton.backgroundColor = UIColor.yellow
        rating.text = "\(2)"
        oneButton.isEnabled = false
        threeButton.isEnabled = false
        fourButton.isEnabled = false
        fiveButton.isEnabled = false
        rating.isHidden = false
        
    }
    
    @IBAction func threeButtonPressed(_ sender: Any) {
        
        threeButton.backgroundColor = UIColor.yellow
        rating.text = "\(3)"
        oneButton.isEnabled = false
        twoButton.isEnabled = false
        fourButton.isEnabled = false
        fiveButton.isEnabled = false
        rating.isHidden = false
    }
    
    @IBAction func fourButtonPressed(_ sender: Any) {
        
        fourButton.backgroundColor = UIColor.yellow
        rating.text = "\(4)"
        oneButton.isEnabled = false
        threeButton.isEnabled = false
        twoButton.isEnabled = false
        fiveButton.isEnabled = false
        rating.isHidden = false
    }
    @IBAction func fiveButtonPressed(_ sender: Any) {
        
        fiveButton.backgroundColor = UIColor.yellow
        rating.text = "\(5)"
        oneButton.isEnabled = false
        threeButton.isEnabled = false
        fourButton.isEnabled = false
        twoButton.isEnabled = false
        rating.isHidden = false
        
    }
    
}

extension YesViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
