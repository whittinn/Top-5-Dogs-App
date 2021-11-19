//
//  SaveResponseViewController.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/17/21.
//

import UIKit

class SaveResponseViewController: UIViewController {
    
    weak var opener : YesViewController?
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
        
        opener!.responseText.text = textViewer.text
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
