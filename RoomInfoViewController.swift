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
    
    var infomations:Array<AnyObject> = []
    let locationCell = reserveLocationCell()
    
    @IBOutlet weak var locationRCell: UITableViewCell!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        guard let infomationURL = Bundle.main.url(forResource: roomInfoFileName, withExtension: "plist") else {
            print("has no file")
            return
        }

        if let infomationArray = NSArray(contentsOf: infomationURL) {
            print(infomationArray)

            infomations = infomations + (infomationArray as Array<AnyObject>)
            print(infomations.count)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func modalDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return infomations.count
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return infomations.count
//    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
//
//        // Configure the cell...
//
//        guard let infomation = infomations[indexPath.row] as? [String:AnyObject] else {
//            return cell
//        }
//
//        let locationRoom = infomation["Location"] as? String ?? ""
////        locationCell.locationText?.text = locationRoom
//        locationRCell.textLabel?.text = locationRoom
//
//        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
