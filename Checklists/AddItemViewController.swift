//
//  addItemViewController.swift
//  Checklists
//
//  Created by Erwin Abrahamse_FP on 20-08-16.
//  Copyright © 2016 Erwin Abrahamse. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
  
  
  @IBOutlet weak var addItemTextField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  
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

  func addItemTextFieldIsNotEmptyActivateDoneButton(addItemTextField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
  {
    let length = addItemTextField.text!.characters.count - range.length + string.characters.count
    doneBarButton.isEnabled = length > 0

        return true
  }
}

