//
//  AdditemTableViewController.swift
//  ADvance Table View
//
//  Created by Moustafa on 10/23/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

protocol Additemdelegate: class {
    func additemVCcanedld(controller:AdditemTableViewController)
    func additemVC(controller:AdditemTableViewController,item:Checklistitem)
    func edititem(controller:AdditemTableViewController,item:Checklistitem)
}



class AdditemTableViewController: UITableViewController {

    
   weak var delegate:Additemdelegate?
    var edititem:Checklistitem?
    var indexofedititem:Int?
    
    @IBOutlet weak var cancelbtn: UIBarButtonItem!
    @IBOutlet weak var addbtn: UIBarButtonItem!
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let item=edititem
        {
        title="Edit Item"
            textfield.text=item.text
        addbtn.isEnabled=true
        }

    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    // MARK: - Table view data source

    

    @IBAction func Done(_ sender: Any) {
       
      if var item=edititem
      {
        item.text=textfield.text
        
        delegate?.edititem(controller: self, item: item)
        }
        
      else
      {
        
        let item=Checklistitem(text: textfield.text!, check: true)
        delegate?.additemVC(controller: self, item: item)
        
        navigationController?.popViewController(animated: true)
        
        }
        
    }
    @IBAction func Cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
       delegate?.additemVCcanedld(controller: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        textfield.becomeFirstResponder()
    }

}


//------------------------------------------------------



extension AdditemTableViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //self.view.endEditing(true)
        //return true
        textfield.resignFirstResponder()
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // i think rande is going to calc the randge of the old text from the defult range of the textfield
        //replacingCharacters going to replace the oldtext by string of range string range
        guard let oldtext=textfield.text,
              let stringrange=Range(range, in: oldtext)else{
                return false
        }
        let newtxt=oldtext.replacingCharacters(in: stringrange, with: string)
        if newtxt.isEmpty
        {
            addbtn.isEnabled=false
        }else
        {
            addbtn.isEnabled=true
        }
        return true
    }
    
    //not working idont no why
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
