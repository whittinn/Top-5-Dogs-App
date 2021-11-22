//
//  GermanSTableExt.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/18/21.
//

import UIKit


extension GermanSViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GermanSTableViewCell.id, for: indexPath) as! GermanSTableViewCell
        cell.downloadPictureFromURL(from: pictures[indexPath.row].previewURL)
        return cell
    
    }
    
}
