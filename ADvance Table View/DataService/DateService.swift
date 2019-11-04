//
//  DataService.swift
//  ADvance Table View
//
//  Created by Moustafa on 10/22/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import Foundation
class DateService
{
    static let instence=DateService()
     lazy var rowItems=[Checklistitem(text:gettitle(), check: true),Checklistitem(text: gettitle(), check: true),Checklistitem(text: "subject 1", check: true),Checklistitem(text: gettitle(), check: true),Checklistitem(text: "subject 2", check: true),Checklistitem(text: gettitle(), check: true),Checklistitem(text: "subject 3", check: true),Checklistitem(text: gettitle(), check: true),Checklistitem(text: gettitle(), check: true),Checklistitem(text: gettitle(), check: true),Checklistitem(text: gettitle(), check: true),Checklistitem(text: gettitle(), check: true),Checklistitem(text: gettitle(), check: true)]
    
    private var titels=["random title 1 ","random title 2"," random title3"," random title4","random title5","random title 6"]
    func gettitle() -> String {
        let randomnum=Int.random(in: 0...titels.count-1)
        return titels[randomnum]
    }
    
    func getrowitems() -> [Checklistitem] {
        return rowItems
    }
    func delete(index:Int)  {
        rowItems.remove(at: index)
    }
    
    func addnewitem(newchecklistitem newItem:Checklistitem){
        rowItems.append(newItem)
        
    }
    func getitem(indexpath index:Int)->Checklistitem
    {
        return rowItems[index]
    }
    
    
}
