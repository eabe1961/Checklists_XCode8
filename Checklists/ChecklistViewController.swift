//
//  ViewController.swift
//  Checklists
//
//  Created by Erwin Abrahamse_FP on 25-07-16.
//  Copyright © 2016 Erwin Abrahamse. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
  
  var row0text = "UI ontwerpen voor FP App"
  var row1text = "Garage bellen"
  var row2text = "Olie laten verversen"
  var row3text = "Ruitenwisservloeistof bijvullen"
  var row4text = "IJs maken en vanavond opeten"
  
  var row0checked = false
  var row1checked = false
  var row2checked = false
  var row3checked = false
  var row4checked = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 5
      }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    
    if let cell = tableView.cellForRow(at: indexPath){
      
      if indexPath.row == 0{
        row0checked = !row0checked
      }
      if indexPath.row == 1{
        row1checked = !row1checked
      }
      if indexPath.row == 2{
        row2checked = !row2checked
      }
      if indexPath.row == 3{
        row3checked = !row3checked
      }
      if indexPath.row == 4{
        row4checked = !row4checked
        }
      
     configureCheckmarkForCell(cell: cell, indexPath: indexPath)
    }
    
  tableView.deselectRow(at: indexPath, animated: true)
    }

  func configureCheckmarkForCell(cell: UITableViewCell, indexPath: IndexPath) {
  
  var isChecked = false
  
  if indexPath.row == 0 {
  isChecked = row0checked
  }else if indexPath.row == 1{
  isChecked = row1checked
  }else if indexPath.row == 2{
    isChecked = row2checked
  }else if indexPath.row == 3{
  isChecked = row3checked
  }else if indexPath.row == 4{
  isChecked = row4checked
}
    
    if isChecked {
      
      cell.accessoryType = .checkmark
    } else{
      cell.accessoryType = .none
    }
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    
    let label = cell.viewWithTag(1000) as! UILabel
    
    if indexPath.row == 0{
      label.text = row0text
    }else if indexPath.row == 1{
      label.text =  row1text
    }else if indexPath.row == 2{
      label.text =  row2text
    }else if indexPath.row == 3{
      label.text =  row3text
    }else if indexPath.row == 4{
      label.text =  row4text
    }
    configureCheckmarkForCell(cell : cell, indexPath: indexPath)
    return cell
    }
}
