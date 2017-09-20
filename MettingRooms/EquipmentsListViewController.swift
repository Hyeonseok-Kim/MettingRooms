//
//  EquipmentsListViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 28..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit
let equipmentFileName = "EquipmentsPlist"

class EquipmentsListViewController: UITableViewController {

    var equipments:Array<AnyObject> = []
    var selectedEQName:String? = "" //name form temp
    var selectedEQValue:Int? = 0 //Amount form temp
//    var submitValue:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        guard let equipmentURL = Bundle.main.url(forResource: equipmentFileName, withExtension: "plist") else{
            print("No File")
            return
        }
        /*
        if let equipmentURL = Bundle.main.url(forResource: equipmentFileName, withExtension: "plist") {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentCell", for: indexPath)

        // Configure the cell...
        
        guard let equipment = equipments[indexPath.row] as? [String:AnyObject] else {
            return cell
        }
        // to be come switch changed
        
        let name = equipment["name"] as? String ?? ""
        cell.textLabel?.text = name
        
//        selectedEQName = name
        
        guard let amount = equipment["amount"] as? Int else{
            return cell
        }
        
//        selectedEQValue = amount
//        print("cellValue\(selectedEQValue!)")
        
        
        cell.detailTextLabel?.text = String(amount) + "원"
        
        return cell
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBAction func unwind(to unwindSegue: UIStoryboardSegue, EquipmentsList subsequentVC: UITableViewController) {
        print("unwind")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //didSelected
        
        guard let equipment = equipments[indexPath.row] as? [String:AnyObject] else {
            return
        }
        
        print("index : \(indexPath.row)")
        print("index items : \(equipments[indexPath.row])")
        
        selectedEQName = equipment["name"] as? String
        selectedEQValue = equipment["amount"] as? Int
        
    }
    
//    @IBAction func loadThirdScreenPressend(_ sender: AnyObject) {
//        performSegue(withIdentifier: "OptionEquipmentsVC", sender: selectedEQName)
//        print("\(String(describing: self.selectedEQName))")
//        
//        performSegue(withIdentifier: "OptionEquipmentsVC", sender: selectedEQValue)
//        print("\(String(describing: self.selectedEQValue))")
//    }
    
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
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "OptionEquipmentsVC"{
            
            let destinationName = segue.destination as! OptionEquipmentsViewController
            destinationName.firstParamName = selectedEQName!
            
            let destinationAmount = segue.destination as! OptionEquipmentsViewController
            destinationAmount.firstParamValue = selectedEQValue!

        }
        
    }

    /*
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        print("preformSegue selectItems = \(selectedEQName!), \(selectedEQValue!)")
    }
    */
    
}






















