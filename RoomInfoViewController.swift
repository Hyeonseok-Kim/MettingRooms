//
//  RoomInfoViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 23..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit
let roomInfoFileName = "ReserveInfomationPlist"

class RoomInfoViewController: UITableViewController {
    
    @IBOutlet weak var locationCell: reserveCell!
    
    @IBOutlet weak var locationCellText: UILabel!
    
    var infomations:Array<AnyObject> = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let infomationURL = Bundle.main.url(forResource: roomInfoFileName, withExtension: "plist") else {
            print("has no file")
            return
        }

        if let infomationArray = NSArray(contentsOf: infomationURL) {
//            print(infomationArray)

            infomations = infomations + (infomationArray as Array<AnyObject>)
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
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "기본정보"
        case 2:
            return "신청가능장비"
        case 3:
            return "특징"
        case 4:
            return "주의사항"
        default :
            return "회의실 정보"
        }
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(reserveCell.self, forCellReuseIdentifier: "locationCell")
        let cell = locationCell
        
        guard let infomation = infomations[indexPath.row] as? [String:AnyObject] else {
//            return locationCell
            return (cell)!
        }
        let locationRoom = infomation["Location"]?[indexPath] as? String ?? ""
        print(indexPath)
        print(indexPath.row)
//        locationCell.backgroundColor = UIColorFromHex(rgbValue: 0x555562, alpha: 1) //셀 배경색상
//        locationCell.textLabel?.textColor = UIColorFromHex(rgbValue: 0xEBEBF1, alpha: 1)//셀 라벨색상
//        locationCell.textLabel?.font = UIFont.systemFont(ofSize: 15)//셀 폰트, 크기
//        locationCellText.sizeToFit()
//        locationCellText.text = locationRoom

        cell?.backgroundColor = UIColorFromHex(rgbValue: 0x555562, alpha: 1) //셀 배경색상
        cell?.textLabel?.textColor = UIColorFromHex(rgbValue: 0xEBEBF1, alpha: 1)//셀 라벨색상
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15)//셀 폰트, 크기
        cell?.detailTextLabel?.text = locationRoom
        
        return (cell)!
//        return locationCell
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
