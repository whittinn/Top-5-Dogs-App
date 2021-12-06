//
//  firstTableViewCell.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/5/21.
//

import UIKit

class firstTableViewCell: UITableViewCell {
    
    static let id = "cell1"
    let userDefaults = UserDefaults()
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var notRatedLabel: UILabel!
    @IBOutlet weak var imageData: UIImageView!
    @IBOutlet weak var pictureInfoButton: UILabel!

    func showDislikedText(_ text: String){
        self.notRatedLabel?.text = text
        
    }
    
    func showLikedText(_ text: String){
        self.notRatedLabel?.text = text
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        self.showLikedText("I like this picture!")
        
    
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        
        self.showDislikedText("I dont like this picture.")
       
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
