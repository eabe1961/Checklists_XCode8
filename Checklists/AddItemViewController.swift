//
//  addItemViewController.swift
//  Checklists
//
//  Created by Erwin Abrahamse_FP on 20-08-16.
//  Copyright © 2016 Erwin Abrahamse. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
  
  @IBOutlet weak var addItemTextField: UITextField!
  
  @IBAction func cancel(){
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func done(){
    print("Contents of the text field is: \(addItemTextField.text!)")
    dismiss(animated: true, completion: nil)
  }

  override func tableView(_ tableView: UITableView, willSelectRowAt willSelectRowAtIndexPath: IndexPath) -> IndexPath?{
    return nil
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear( animated)
    addItemTextField.becomeFirstResponder()
    
  }
}

