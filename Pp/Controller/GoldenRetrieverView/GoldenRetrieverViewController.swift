//
//  ViewController2.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/5/21.
//

import UIKit

class GoldenRetrieverViewController : UIViewController {
    
    
    var pictures : [Hit] = []
    var selectedPicture: Hit?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Golden Retriever"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.dataSource = self
        tableView.delegate = self
        
        NetworkMananger.shared.getInfo { [weak self] (results) in
            guard let self = self else {return }
            
            switch results {
            
            case .failure(let error):
                print(error)
                
            case .success(let pictures):
                self.pictures = pictures
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
            }
        }
        
    }
    
   
    
}
