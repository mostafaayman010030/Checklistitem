
//  Created by Moustafa on 10/21/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {
    var list1:Checklistitem?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navbar=navigationController?.navigationBar
        navbar?.prefersLargeTitles=false
        navbar?.barTintColor=#colorLiteral(red: 0.9254902005, green: 0.4780175497, blue: 0.0534089793, alpha: 1)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DateService.instence.getrowitems().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell:Item_Cell=(tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as? Item_Cell)!
        {
            var item = DateService.instence.getrowitems()[indexPath.row]
            
            cell.updatecellitem(itemset: item)
            return cell
        }
        
      
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell:Item_Cell=tableView.cellForRow(at: indexPath)as? Item_Cell{
            upgradechecklist(cell: cell, indexPath: indexPath)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    func upgradechecklist(cell:UITableViewCell,indexPath:IndexPath) {
              
        var ischecked=DateService.instence.getrowitems()[indexPath.row].check!
        
        guard let checklist=cell.viewWithTag(10)as? UILabel else{return}
        if ischecked
            {
                checklist.text = "√"
                
            }
        else
        {
            checklist.text = ""
        }
            ischecked = !ischecked
        
        
    }

//    @IBAction func additem(_ sender: Any) {
//
//        let newitem:Checklistitem=Checklistitem(text:"\( DateService.instence.gettitle()) (new)", check: true)
//        var itemaddded=DateService.instence.addnewitem(newchecklistitem: newitem)
//        tableView.reloadData()
//
//
//        print("item is added")
//    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        DateService.instence.delete(index: indexPath.row)
//        DateService.instence.delete(index: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
//        DateService.instence.getitem(indexpath: indexPath.row)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "additem"
        {
            if let additemVC=segue.destination as? AdditemTableViewController{
                additemVC.delegate=self
            }
        }
        else if segue.identifier == "edititem"
        {
            
            if let editvc = segue.destination as? AdditemTableViewController
            {
                if let cell = sender as? UITableViewCell,let indexpath=tableView.indexPath(for: cell)
                {
                    list1=DateService.instence.getrowitems()[indexpath.row]
                    
                    editvc.edititem=self.list1
                
                    editvc.delegate = self
                }
            }
            
//            if let edititemvc=segue.destination as? AdditemTableViewController
//            {
//                if let cell=sender as? UITableViewCell,let indexpath=tableView.indexPath(for: cell)
//                {
//                    let item=DateService.instence.getitem(indexpath: indexpath.row)
//                    edititemvc.edititem=item
//                    let index:Int=indexpath.row
//                    edititemvc.indexofedititem=index
//                    edititemvc.delegate=self
//                }
//            }
        }
    }
    
    // to edit items
   /* override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
    }*/
    
}
//----------------------------------------------------------------------

extension MainVC:Additemdelegate{
  
    
    
    func additemVCcanedld(controller: AdditemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func additemVC(controller: AdditemTableViewController, item: Checklistitem) {
        navigationController?.popViewController(animated: true)
        let rowindex=DateService.instence.getrowitems().count
        DateService.instence.addnewitem(newchecklistitem: item)
        // بيهم نافع منغيرهم نافع  شكل الفكره انى لو معملتش reload لازم اخزن المسار بتاعه و احفظه و اضيفه
        
        
        /*let indexpath=IndexPath(row: rowindex, section: 0)
        let indexpaths=[indexpath]
        tableView.insertRows(at: indexpaths, with: .automatic)*/
        tableView.reloadData()
    }
    
    func edititem(controller: AdditemTableViewController, item: Checklistitem) {
       if let index=DateService.instence.getrowitems().index(of:item)
        {
            let indexpath=IndexPath(row: index, section: 0)
            if let cell:Item_Cell=tableView.cellForRow(at: indexpath) as? Item_Cell
            {
                cell.updatecellitem(itemset:item)
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}


