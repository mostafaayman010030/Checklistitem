//
//  Checklistitem.swift
//  ADvance Table View
//
//  Created by Moustafa on 10/22/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import Foundation
class Checklistitem:NSObject
{
    public var text:String!
    public var check:Bool!
    
    
    init(text:String,check:Bool) {
        self.check=check
        self.text=text
    }
    

    
    
}

