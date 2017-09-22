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
    
    var equipmentsApplyCutArray:Array<AnyObject> = [] // Apply ∩ Param
    
    var firstParamName:String = ""
    var firstParamValue:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        guard let equipmentApplyURL = Bundle.main.url(forResource: equipmentThisFile, withExtension: "plist") else{
            return
        }
        
        if let equipmentArray = NSArray(contentsOf: equipmentApplyURL) {
            ////////////////////////
            let cirName:Array<AnyObject> = equipmentArray.value(forKey: "Name") as! Array<AnyObject> //equipmentArray Temp of name
            let cirAmount:Array<AnyObject> = equipmentArray.value(forKey: "Amount") as! Array<AnyObject> //equipmentArray Temp of amount
            
            for i in 0 ..< 15 { //Apply ∩ Param in the equipmentsApplyCutArray
                if cirName[i] as! String == firstParamName{
                    equipmentsApplyCutArray.append(cirAmount[i])
                }
            }
            print(equipmentsApplyCutArray)
            ////////////////////////
            //equipmentsApply = equipmentsApply + (equipmentArray as Array<AnyObject>)
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
        
        // Outside값과 해당하는 값만 return 해서 apply에 넣는다
//        var discountArray:Array<AnyObject> = []
//        
//        for i in (0..<equipmentsApply.count) {
//            if equipmentsApply[i] as! (String, Int) == (String(firstParamName), Int(firstParamValue)){
//                if equipmentsApply[i] as! Int == firstParamValue{
//                    discountArray = discountArray + ((equipmentsApply[i]) as! Array<AnyObject>)
//                    print(discountArray)
//                }
//            }
//        }
        
        //////////////////////////////
//        switch firstParamName {
//        case "iMac":
//            return equipmentsApply.count-10
//        case "MacBook Pro":
//            return equipmentsApply.count-4
//        case "MacBook Air":
//            return equipmentsApply.count-2
//        case "MacBook":
//            return equipmentsApply.count
//        default:
//            return 0
//        }
        //////////////////////////////
        
        //Apply를 Outside값 수 만큼만 카운트하면...
        
//        if let cutCount = equipmentsApply.first { //cutCount = Apply ∩ Param
//            print(cutCount)
//            return equipmentsApply.count
//        }
        //---------20일
//        var disCount = equipmentsApply.count - (equipmentsApply.count - firstParamName.count)
//        return disCount.count
//        return equipmentsApply.count
        return equipmentsApplyCutArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellAppend:Int = 0
        let nameCell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        
        // Configure the cell...
        
//        guard let equipmentSection = equipmentsApply[indexPath.row] as? [String:AnyObject] else {
//            return nameCell
//        }
        
        nameCell.textLabel?[indexPath.row].text = firstParamName
        nameCell.detailTextLabel?.text = String(describing: equipmentsApplyCutArray[cellAppend])
//        for cellAppend in 0..<(equipmentsApplyCutArray.count){
//            nameCell.detailTextLabel?.text = String(describing: equipmentsApplyCutArray[cellAppend])
//        }
        
        //nameCell.detailTextLabel?.text = String(firstParamValue)
        
//        let name = equipmentSection["Name"] as? String ?? ""
//        nameCell.textLabel?.text = name
//
//        if let amount = equipmentSection["Amount"] as? Int {
//            nameCell.detailTextLabel?.text = String(amount)
//        }
        
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
        cellAppend = cellAppend+1 //for func check
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
    /*
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if firstParamValue != 0 {
            print("prepareItems : \(firstParamName), \(firstParamValue)")
        }else {
            print("Notting..")
        }
    }
    */
}
