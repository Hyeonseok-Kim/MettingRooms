//
//  RoomInfoViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 23..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit

var plistFormat = "reservationPlist-"
var precautionsFormat = "reservationPlist-precautions"

class RoomInfoViewController: UITableViewController {
    var plistFormatSource = Common.sharedInstance.title
    
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
        var plistFormat = "reservationPlist-" //dismiss 후 재 선택 전 값 초기화

        var title = Common.sharedInstance.title.substring(to: (Common.sharedInstance.title.index(of: "/"))!)
        title = title + "실 정보"
        self.title = title
        
        switch Common.sharedInstance.title {
        case "제주/Jeju":
            plistFormat = plistFormat + "jeju"
            print("plistFormat :\(plistFormat)") //dismiss후 재 선택 시 반복적으로 값을 담는지 체크하기 위함
        case "버뮤다/Bermuda":
            plistFormat = plistFormat + "bermuda"
            print("plistFormat :\(plistFormat)")
        case "시실리/Sicily":
            plistFormat = plistFormat + "sicily"
            print("plistFormat :\(plistFormat)")
        case "몰디브/Moldiv":
            plistFormat = plistFormat + "moldiv"
            print("plistFormat :\(plistFormat)")
        default:
            break;
        }
        
        guard let plistURL = Bundle.main.url(forResource: plistFormat, withExtension: "plist") else {
            print("has no file")
            return
        }
        print("fileOf:\(Common.sharedInstance.title)")
        
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
        guard let infomation = infomations[indexPath.row] as? [String:AnyObject] else{
            return meetingRoomInfo_Cell
        }
        
        let label = infomation["Label"] as? String ?? ""
        let value = infomation["Value"] as? String ?? ""
        
        
        
        //REVERSE
        guard let cell1 = infomations[5] as? [String:AnyObject] else{
            return meetingRoomInfo_Cell
        }
        guard let cell2 = infomations[4] as? [String:AnyObject] else{
            return meetingRoomInfo_Cell
        }
        guard let cell3 = infomations[3] as? [String:AnyObject] else{
            return meetingRoomInfo_Cell
        }
        guard let cell4 = infomations[2] as? [String:AnyObject] else{
            return meetingRoomInfo_Cell
        }
        guard let cell5 = infomations[1] as? [String:AnyObject] else{
            return meetingRoomInfo_Cell
        }
        guard let cell6 = infomations[0] as? [String:AnyObject] else{
            return meetingRoomInfo_Cell
        }
        
        let label1 = cell1["Label"] as? String ?? ""
        let value1 = cell1["Value"] as? String ?? ""
        
        let label2 = cell2["Label"] as? String ?? ""
        let value2 = cell2["Value"] as? String ?? ""
        
        let label3 = cell3["Label"] as? String ?? ""
        let value3 = cell3["Value"] as? String ?? ""
        
        let label4 = cell4["Label"] as? String ?? ""
        let value4 = cell4["Value"] as? String ?? ""
        
        let label5 = cell5["Label"] as? String ?? ""
        let value5 = cell5["Value"] as? String ?? ""
        
        let label6 = cell6["Label"] as? String ?? ""
        let value6 = cell6["Value"] as? String ?? ""
        
        
        switch indexPath {
        case [0,0]:
            informationLabel.text = label1
            informationValue.text = value1
            print("셀: \(String(describing: informationLabel.text))\n\(indexPath)")
        case [0,1]:
            capacityLabel.text = label2
            capacityValue.text = value2
            print("셀: \(String(describing: capacityLabel.text))\n\(indexPath)")
        case [0,2]:
            facilitiesLabel.text = label3
            facilitiesValue.text = value3
            print("셀: \(String(describing: facilitiesLabel.text))\n\(indexPath)")
        case [0,3]:
            equipmentsLabel.text = label4
            equipmentsValue.text = value4
            print("셀: \(String(describing: equipmentsLabel.text))\n\(indexPath)")
        case [0,4]:
            applicatedEQLabel.text = label5
            applicatedEQValue.text = value5
            print("셀: \(String(describing: applicatedEQLabel.text))\n\(indexPath)")
        case [0,5]:
            precautionsLabel.text = label6
            precautionsValue.text = value6
            print("셀: \(String(describing: precautionsLabel.text))\n\(indexPath)")
        default:
            break;
        }
        
        return meetingRoomInfo_Cell
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
