//
//  BeagleTableViewCell.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/18/21.
//

import UIKit

class BeagleTableViewCell: UITableViewCell {

    
    static let id = "cell123"
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var pictureInfoLabel: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var imageData: UIImageView!
    
    @IBAction func noButtonTapped(_ sender: Any) {
        self.showLikeText("I like this picture!")
        
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        self.showDislikeText("I don't like this picture.")
    }
    
    func showLikeText(_ text: String){
        self.ratingLabel?.text = text
        
    }
    
    func showDislikeText(_ text: String){
        self.ratingLabel?.text = text
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
