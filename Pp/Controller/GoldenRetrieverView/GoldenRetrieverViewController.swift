//
//  ViewController2.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/5/21.
//

import UIKit

class GoldenRetrieverViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    var pictures : [Hit] = []

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Golden Retriever"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
                tableView.delegate = self
        tableView.dataSource = self
        
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
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ViewController1"{
//
//           if  let vc = segue.destination as? ViewController1{
//            vc.tagsLabel?.text = pictures[IndexPath]
//
//
//            }
//        }
//    }
     
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let vc = storyboard?.instantiateViewController(identifier: "ViewController1") as? YesViewController
//
//        navigationController?.pushViewController(vc!, animated: true)
//    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell123", for: indexPath) as! firstTableViewCell
       
        cell.downloadPictureFromURL(from: pictures[indexPath.row].previewURL)
        
        return cell
      
    }
  
    
    
}
