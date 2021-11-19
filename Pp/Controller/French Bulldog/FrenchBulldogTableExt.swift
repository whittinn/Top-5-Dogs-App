//
//  FrenchBulldogTableExt.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/18/21.
//

import UIKit

extension FrenchBulldogViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FrenchBulldogTableViewCell.id, for: indexPath) as! FrenchBulldogTableViewCell
        cell.downloadPictureFromURL(from: pictures[indexPath.row].previewURL)
        return cell
        
    
    }
    
    
    
    
    
}
