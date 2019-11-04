//
//  Item_Cell.swift
//  ADvance Table View
//
//  Created by Moustafa on 10/22/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class Item_Cell: UITableViewCell {

    @IBOutlet weak var textlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func updatecellitem(itemset:Checklistitem)
    {
        textlbl?.text=itemset.text
        			
    }
    
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }

}
