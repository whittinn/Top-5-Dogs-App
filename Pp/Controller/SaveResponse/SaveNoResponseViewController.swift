//
//  SaveNoResponseViewController.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/18/21.
//

import UIKit

class SaveNoResponseViewController: UIViewController {

   
    weak var opener : NoViewController!
    var previewText : String?
    
    @IBOutlet weak var textViewer: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Type response"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textViewer.text = previewText
        
    }
    
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        opener!.pictureDescriptionText.text = textViewer.text
        self.dismiss(animated: true, completion: nil)
        
    }
    
   
    
}
