//
//  ReserveRoomViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 24..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit

class ReserveRoomViewController: UITableViewController {
    var datePick : Date = Date() //reservation의 값 전달 파라미터역할(reservation.date:Date())
    var stringToDate:String = "예약날짜를 표시합니다."
    
    @IBOutlet weak var hostNameField: UITextField!
    
    @IBOutlet weak var attendeesField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var equipmentField: UITextField!
    
    @IBOutlet weak var cateringSwitch: UISwitch!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBAction func textFieldEditing(_ sender: UITextField) {
            
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ReserveRoomViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "yy년 MM월 dd일 a h시mm분"
        
        dateTextField.text = dateFormatter.string(from: sender.date) //textLabel에 표시됨
        stringToDate = dateFormatter.string(from: sender.date) //파라미터역할(datePick)의 값을 위함
        datePick = dateFormatter.date(from: stringToDate)!
        datePick.addTimeInterval(32400)
        print("현재시각 : \(datePick)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "회의실 예약하기"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newReservation() -> Reservation?{
        let reservation = Reservation()
        let host = hostNameField.text!
        
        if host.isEmpty {
            return nil
        }
        reservation.hostName = host
        reservation.date = datePick
        reservation.dateToString = stringToDate //리스트에 한글로 String출력

        print("데이터 전송 시각 : \(datePick)")
        if let equipmentArray = equipmentField.text?.characters.split(separator: ",").map(String.init){
            reservation.equipments = equipmentArray
        }
        reservation.catering = cateringSwitch.isOn
        return reservation
    }
    
    @IBAction func makeReservation(_ sender: Any) {
        guard let reservation = newReservation() else{
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        switch self.presentingViewController{
        case let tabBarC as UITabBarController:
            if let navigationC = tabBarC.selectedViewController as? UINavigationController, let reservationListVC = navigationC.topViewController as? ReservationListViewController {
                reservationListVC.addNewItem(reservation: reservation)
            }
        case let navigationC as UINavigationController:
            if let reservationListVC = navigationC.topViewController as? ReservationListViewController{
                reservationListVC.addNewItem(reservation: reservation)
            }
        case let reservationListVC as ReservationListViewController:
            reservationListVC.addNewItem(reservation: reservation)
        default:
            break
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancleReservation(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
     */
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
     if segue.identifier == "ReserveDone"{
        guard let reservation = newReservation(), let reservationListVC = segue.destination as? ReservationListViewController else {
            return
        }
            reservationListVC.addNewItem(reservation: reservation)
        }
    }
}
