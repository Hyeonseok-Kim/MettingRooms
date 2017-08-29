//
//  EquipmentsListViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 28..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit
let EquipmentFileName = "EquipmentsPlist"

class EquipmentsListViewController: UITableViewController {

    var equipments:Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        guard let equipmentURL = Bundle.main.url(forResource: EquipmentFileName, withExtension: "plist") else{
            print("No File")
            return
        }
        /*
        if let equipmentURL = Bundle.main.url(forResource: EquipmentFileName, withExtension: "plist") {
            do{
                let data = try Data(contentsOf: equipmentURL)
                let swiftDictionary = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
            } catch {
                print(error)
            }
        }*/
        
        if let equipmentArray = NSArray(contentsOf: equipmentURL) {
            print(equipmentArray)
            
            equipments = equipments + (equipmentArray as Array<AnyObject>)
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
        return equipments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        guard let equipment = equipments[indexPath.row] as? [String:AnyObject] else {
            return cell
        }
        // to be come switch changed
        if let name = equipment["name"] as? String {
            cell.textLabel?.text = name
        }
        
        if let amount = equipment["amount"] as? Int {
            cell.detailTextLabel?.text = String(amount)
        }
        /*
        if let late = equipment["Late"] as? String {
            cell.textLabel?.text = late
        }
        
        if let display = equipment["Display"] as? String {
            cell.textLabel?.text = display
        }
        
        if let defaultCore = equipment["Default core"] as? String {
            cell.textLabel?.text = defaultCore
        }
        
        if let turboBoost = equipment["Turbo Boost"] as? String {
            cell.textLabel?.text = turboBoost
        }
        
        if let defaultRam = equipment["Default ram"] as? String {
            cell.textLabel?.text = defaultRam
        }
        
        if let defaultStorage = equipment["Default storage"] as? Int {
            cell.textLabel?.text = String(defaultStorage)
        }
        
        if let defaultStorage = equipment["Default Storage(SSD)"] as? Int {
            cell.textLabel?.text = String(defaultStorage)
        }
        
        if let defaultStorage = equipment["Default storage(1TB Serial ATA)"] as? Int {
            cell.textLabel?.text = String(defaultStorage)
        }
        
        if let graphicCard = equipment["Graphic card"] as? String {
            cell.textLabel?.text = graphicCard
        }
        
        if let forceTouchTrackpad = equipment["Force touch trackpad"] as? Bool {
            cell.textLabel?.text = String(forceTouchTrackpad)
        }
        
        if let touchBar = equipment["Touchbar"] as? Bool {
            cell.textLabel?.text = String(touchBar)
        }
        
        if let touchId = equipment["TouchID"] as? Bool {
            cell.textLabel?.text = String(touchId)
        }
        
        if let port = equipment["Port"] as? String {
            cell.textLabel?.text = port
        }
        
        if let earJack = equipment["3.5pi earjack"] as? Bool {
            cell.textLabel?.text = String(earJack)
        }
        */
        return cell
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
