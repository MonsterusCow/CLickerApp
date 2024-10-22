//
//  TableFile.swift
//  StarkClassmates
//
//  Created by RYAN STARK on 10/9/24.
//

import Foundation
import UIKit

class CellStuff: UITableViewCell{
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(Name: String) {
        nameLabel.text = Name
    }
    
    
    
    
    
}
