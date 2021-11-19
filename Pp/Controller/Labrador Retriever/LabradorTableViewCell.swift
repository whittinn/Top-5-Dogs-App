//
//  LabradorTableViewCell.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/18/21.
//

import UIKit

class LabradorTableViewCell: UITableViewCell {

   static let id = "cell123"
    @IBOutlet weak var imageData: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    func showLikeText(_ text : String){
        self.ratingLabel?.text = text
    }
    
    func showDislikeText(_ text : String){
        self.ratingLabel?.text = text
    }
    
    
    @IBAction func noButtonPressed(_ sender: Any) {
        showDislikeText("I don't like this picture.")
    }
    
    @IBAction func yesButtonPressed(_ sender: Any) {
        showLikeText("I like this picture!")
    }
    
    func downloadPictureFromURL(from url: String){
        
        NetworkMananger.shared.downloadImage(from: url) {[weak self] (picture) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.imageData.image = picture
            }
        }
    }
    
    
}
