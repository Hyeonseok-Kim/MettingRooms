//
//  OptionEquipmentsViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 9. 4..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit
let equipmentThisFile = "EquipmentsDefault"

class OptionEquipmentsViewController: UITableViewController {
    
    var equipmentsApply:Array<AnyObject> = []
    var equipmentsOutsideName:String = ""
    var equipmentsOutsideValue:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        guard let equipmentApplyURL = Bundle.main.url(forResource: equipmentThisFile, withExtension: "plist") else{
//            print("No File")
            return
        }
        
        if let equipmentArray = NSArray(contentsOf: equipmentApplyURL) {
            equipmentsApply = equipmentsApply + (equipmentArray as Array<AnyObject>)
//            print("plist 데이터 : \(equipmentsApply)") //test
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return equipmentsApply.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let nameCell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        
        // Configure the cell...
        
        guard let equipmentSection = equipmentsApply[indexPath.row] as? [String:AnyObject] else {
            return nameCell
        }
        
        if let name = equipmentSection["Name"] as? String {
            nameCell.textLabel?.text = name
        }
        
        if let amount = equipmentSection["Amount"] as? Int {
            nameCell.detailTextLabel?.text = String(amount)
        }
        //
        //        if let late = equipmentSection["Late"] as? String {
        //            cell.textLabel?.text = late
        //        }
        //        if let display = equipmentSection["Display"] as? String {
        //            cell.textLabel?.text = display
        //        }
        //
        //        if let defaultCore = equipmentSection["Default core"] as? String {
        //            cell.textLabel?.text = defaultCore
        //        }
        //
        //        if let turboBoost = equipmentSection["Turbo Boost"] as? String {
        //            cell.textLabel?.text = turboBoost
        //        }
        //
        //        if let defaultRam = equipmentSection["Default ram"] as? String {
        //            cell.textLabel?.text = defaultRam
        //        }
        //
        //        if let defaultStorage = equipmentSection["Default storage"] as? Int {
        //            cell.textLabel?.text = String(defaultStorage)
        //        }
        //
        //        if let defaultStorage = equipmentSection["Default Storage(SSD)"] as? Int {
        //            cell.textLabel?.text = String(defaultStorage)
        //        }
        //
        //        if let defaultStorage = equipmentSection["Default storage(1TB Serial ATA)"] as? Int {
        //            cell.textLabel?.text = String(defaultStorage)
        //        }
        //
        //        if let graphicCard = equipmentSection["Graphic card"] as? String {
        //            cell.textLabel?.text = graphicCard
        //        }
        //
        //        if let forceTouchTrackpad = equipmentSection["Force touch trackpad"] as? Bool {
        //            cell.textLabel?.text = String(forceTouchTrackpad)
        //        }
        //
        //        if let touchBar = equipmentSection["Touchbar"] as? Bool {
        //            cell.textLabel?.text = String(touchBar)
        //        }
        //
        //        if let touchId = equipmentSection["TouchID"] as? Bool {
        //            cell.textLabel?.text = String(touchId)
        //        }
        //                
        //        if let port = equipmentSection["Port"] as? String {
        //            cell.textLabel?.text = port
        //        }
        //                
        //        if let earJack = equipmentSection["3.5pi earjack"] as? Bool {
        //            cell.textLabel?.text = String(earJack)
        //        }
        
        return nameCell

    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    
    @IBAction func unwind(to unwindSegue: UIStoryboardSegue, OptionEquipments subsequentVC: UITableViewController) {
        print("unwind")
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
