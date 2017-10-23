//
//  RoomInfoViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 23..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit
//let roomInfoFileName = "ReserveInfomationPlist"
var plistFormat = "reservationPlist-"
var precautionsFormat = "precautions"
var Cell = RoomInfoCell()

class RoomInfoViewController: UITableViewController {
    var plistFormatSource = ""
    
    @IBOutlet weak var meetingRoomInfo_Cell: UITableViewCell!
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var informationValue: UILabel!
    
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var capacityValue: UILabel!
    
    @IBOutlet weak var facilitiesLabel: UILabel!
    @IBOutlet weak var facilitiesValue: UILabel!
    
    @IBOutlet weak var equipmentsLabel: UILabel!
    @IBOutlet weak var equipmentsValue: UILabel!
    
    @IBOutlet weak var applicatedEQLabel: UILabel!
    @IBOutlet weak var applicatedEQValue: UILabel!
    
    @IBOutlet weak var precautionsLabel: UILabel!
    @IBOutlet weak var precautionsValue: UILabel!
    
    var infomations:Array<AnyObject> = []
    var precautions:Array<AnyObject> = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        guard let infomationURL = Bundle.main.url(forResource: roomInfoFileName, withExtension: "plist") else {
//            print("has no file")
//            return
//        }
//
//        if let infomationArray = NSArray(contentsOf: infomationURL) {
////            print(infomationArray)
//
//            infomations = infomations + (infomationArray as Array<AnyObject>)
//        }
//
        switch plistFormatSource {
        case "제주/Jeju":
            plistFormat = plistFormat + "jeju"
        case "버뮤다/Bermuda":
            plistFormat = plistFormat + "bermuda"
        case "시실리/Sicily":
            plistFormat = plistFormat + "sicily"
        case "몰디브/Moldiv":
            plistFormat = plistFormat + "moldiv"
        default:
            print("Source :\(plistFormatSource)")
            break;
        }
        
        guard let plistURL = Bundle.main.url(forResource: plistFormat, withExtension: "plist") else {
            print("fileOf:\(plistFormatSource)")
            print("has no file")
            return
        }
        precautionsFormat = plistFormat + precautionsFormat
        guard let precautionsURL = Bundle.main.url(forResource: precautionsFormat, withExtension: "plist") else {
            print("has no precautions")
            return
        }
        
        if let plistArray = NSArray(contentsOf: plistURL) {
            print(plistArray)
            infomations = infomations + (plistArray as Array<AnyObject>)
        }
        if let precautionsArray = NSArray(contentsOf: precautionsURL) {
            precautions = precautions + (precautionsArray as Array<AnyObject>)
        }
    }

    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func modalDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infomations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // code..
        
//        tableView.register(RoomInfoCell.self, forCellReuseIdentifier: "meetingRoomInfo_Cell")
        
        guard let infomation = infomations[indexPath.row] as? [String:AnyObject] else{
            return meetingRoomInfo_Cell
        }
        
        let label = infomation["Label"] as? String ?? ""
        let value = infomation["Value"] as? String ?? ""
        
//        informationLabel.text = label
//        informationValue.text = value
//        print(indexPath)

        switch indexPath {
        case [0,0]:
            informationLabel.text = label
            informationValue.text = value
        case [0,1]:
            capacityLabel.text = label
            capacityValue.text = value
        case [0,2]:
            facilitiesLabel.text = label
            facilitiesValue.text = value
        case [0,3]:
            equipmentsLabel.text = label
            equipmentsValue.text = value
        case [0,4]:
            applicatedEQLabel.text = label
            applicatedEQValue.text = value
        case [0,5]:
            precautionsLabel.text = label
            precautionsValue.text = value
        default:
            break;
        }
        return meetingRoomInfo_Cell
//        return cell
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
