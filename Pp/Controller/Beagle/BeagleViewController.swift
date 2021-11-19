//
//  BeagleViewController.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/18/21.
//

import UIKit

class BeagleViewController: UIViewController{
  
    

   

    var pictures : [Hit] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        NetworkMananger.shared.beagleInfo { [weak self] (result) in
            guard let self = self else {return }
            
            switch result{
            case .failure(let error):
            print(error)
            
            case .success(let pictures):
                self.pictures = pictures
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            
            }
        }
        
        
      title = "Beagle"
    }
    

   
}
