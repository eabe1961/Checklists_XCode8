//
//  addItemViewController.swift
//  Checklists
//
//  Created by Erwin Abrahamse_FP on 20-08-16.
//  Copyright © 2016 Erwin Abrahamse. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
  func addItemViewControllerDidCancel(_ controller: AddItemViewController)
  func addItemViewController(_ controller: AddItemViewController, didFinishAddingItem: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
  
  
  @IBOutlet weak var addItemTextField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  weak var delegate: AddItemViewControllerDelegate?
  
  @IBAction func cancel(){
    delegate?.addItemViewControllerDidCancel(self)
  }
  
  @IBAction func done(){
    let item = ChecklistItem()
    item.text = addItemTextField.text!
    item.checked = false
    
    delegate?.addItemViewController(self, didFinishAddingItem: item)
  }

  override func tableView(_ tableView: UITableView, willSelectRowAt willSelectRowAtIndexPath: IndexPath) -> IndexPath?{
    return nil
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear( animated)
    addItemTextField.becomeFirstResponder()
  }

  private func ActivateDoneButton(_ addItemTextField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
  {
    let length = addItemTextField.text!.characters.count - range.length + string.characters.count
    doneBarButton.isEnabled = length > 0
    return true
  }
 
}



