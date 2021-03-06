//
//  ReservationListViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 24..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit

class ReservationListViewController: UITableViewController {
    
    var meetingRoom:MeetingRoom?
    var newReservation:Reservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.title = meetingRoom?.name.substring(to: (meetingRoom?.name.index(of: "/"))!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addNewItem(reservation:Reservation){
        if (self.meetingRoom?.reservations?.append(reservation)) == nil {
            self.meetingRoom?.reservations = [reservation]
        }
        dataCenter.save()
        self.tableView.reloadData()
    }
    
    @IBAction func unwind(to unwindSegue: UIStoryboardSegue, ReservationList subsequentVC: UITableViewController) {
        print("unwind")
    }
    
    override func viewWillDisappear(_ animated: Bool) { //back button event Hidden
        self.navigationController?.isToolbarHidden = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let rowCount = meetingRoom?.reservations?.count else{
            return 0
        }
        
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell", for: indexPath)
        
        guard let reservation = meetingRoom?.reservations?[indexPath.row] else{
            return cell
        }
    
        //Old Reservations Checking
        var nowDate = Date()
        nowDate.addTimeInterval(32400)
        //--
//        if reservation.date <= nowDate {
//            reservation.dateToString.sorted()
//            cell.textLabel?.text = reservation.dateToString
//            cell.detailTextLabel?.text = reservation.hostName
//        }else {
//            cell.textLabel?.text = reservation.dateToString
//            cell.detailTextLabel?.text = reservation.hostName
//        }
        var tempCell:Array<AnyObject> = []
//        let tempIndex = 0
        if nowDate >= reservation.date {
            tempCell.append(reservation.dateToString as AnyObject)
            tempCell.append(reservation.hostName as AnyObject)
        }

        if tempCell.count == 0 {
            cell.textLabel?.text = reservation.dateToString
            cell.detailTextLabel?.text = reservation.hostName
        }else {
            cell.textLabel?.text = tempCell[0] as? String
            cell.detailTextLabel?.text = tempCell[1] as? String
            cell.accessoryType = .checkmark
        }
        
        print("---------------\n\(tempCell)")
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            meetingRoom?.reservations?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            dataCenter.save()
            print("deleteCell")
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
        
        if segue.identifier == "ConferenceReservation" {
            guard let destination = segue.destination as? ReserveRoomViewController , let meetingRoom = meetingRoom?.name.substring(to: (meetingRoom?.name.index(of: "/"))!) else{
                return
            }
            print(meetingRoom)
        }
    }
     */
}
