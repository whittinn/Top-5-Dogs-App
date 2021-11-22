//
//  GoldenRetrieverTableExt.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/18/21.
//

import UIKit


extension GoldenRetrieverViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell123", for: indexPath) as! firstTableViewCell
        
        cell.downloadPictureFromURL(from: pictures[indexPath.row].previewURL)
        
        return cell
        
    }
}

extension GoldenRetrieverViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = pictures[indexPath.row]
        selectedPicture = row
        
    }
}
