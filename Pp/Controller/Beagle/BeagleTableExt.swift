//
//  BeaglwTableExt.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/18/21.
//

import UIKit

extension  BeagleViewController : UITableViewDataSource {
    


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    pictures.count
    
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeagleTableViewCell.id, for: indexPath) as! BeagleTableViewCell
        cell.downloadPictureFromURL(from: pictures[indexPath.row].previewURL)
        
        return cell
    }
    
}
