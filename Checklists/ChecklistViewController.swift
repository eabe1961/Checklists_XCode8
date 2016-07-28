//
//  ViewController.swift
//  Checklists
//
//  Created by Erwin Abrahamse_FP on 25-07-16.
//  Copyright © 2016 Erwin Abrahamse. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
  
  var items: [ChecklistItem]
  
  required init?(coder aDecoder: NSCoder) {
    
    items = [ChecklistItem] ()
    
    let row0item = ChecklistItem()
    row0item.text = "UI ontwerpen voor FP App"
    row0item.checked = false
    items.append(row0item)
    
    let row1item = ChecklistItem()
    row1item.text = "Garage bellen"
    row1item.checked = false
    items.append(row1item)
    
    let row2item = ChecklistItem()
    row2item.text = "Olie laten verversen"
    row2item.checked = false
    items.append(row2item)
    
    let row3item = ChecklistItem()
    row3item.text = "Ruitenwisservloeistof bijvullen"
    row3item.checked = false
    items.append(row3item)
    
    let row4item = ChecklistItem()
    row4item.text = "IJs maken en vanavond opeten"
    row4item.checked = false
    items.append(row4item)
    
    let row5item = ChecklistItem()
    row5item.text = "Geraldine bellen aankomsttijd bij Pa"
    row5item.checked = false
    items.append(row5item)
    
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    
    let item = items[indexPath.row]
    
    configureTextForCell(cell: cell, withChecklistItem: item)
    configureCheckmarkForCell(cell: cell, withChecklistItem: item)
      
      return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    
    if let cell = tableView.cellForRow(at: indexPath){
      
      let item = items[indexPath.row]
      item.toggleChecked()
      
      configureCheckmarkForCell(cell : cell, withChecklistItem : item)
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
   
  }
  
  func configureTextForCell(cell : UITableViewCell, withChecklistItem item : ChecklistItem){
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = item.text
  }
  
  func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item : ChecklistItem) {
    
    if item.checked {
      
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
  }
  
  
 }
