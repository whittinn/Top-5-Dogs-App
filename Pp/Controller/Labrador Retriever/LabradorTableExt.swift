//
//  LabradorTableExt.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/18/21.
//

import UIKit


extension LabradorViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LabradorTableViewCell.id, for: indexPath) as! LabradorTableViewCell
        cell.downloadPictureFromURL(from: pictures[indexPath.row].previewURL)
        return cell
    }
    
    
    
    
}
