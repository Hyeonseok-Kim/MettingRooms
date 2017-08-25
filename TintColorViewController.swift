//
//  TintColorViewController.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 25..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit

func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

enum TintColor:Int {
    case Blue = 0, Red, Green, Purple, Brawn, Basic
    
    var color:UIColor { get{
        switch self {
        case .Blue:
            return UIColorFromRGB(rgbValue: 0x0066FF) //global set color
        case .Red:
            return UIColorFromRGB(rgbValue: 0xFF2E68) //global set color
        case .Green:
            return UIColorFromRGB(rgbValue: 0x00BB10) //global set color
        case .Purple:
            return UIColorFromRGB(rgbValue: 0xBD63F9) //global set color
        case .Brawn:
            return UIColorFromRGB(rgbValue: 0xD18C22) //global set color
        case .Basic:
            return UIColorFromRGB(rgbValue: 0x057AFF) //global set color
        }}
    }
}

let TintColorKey = "TintColor"

func applyTintColor(color:UIColor) {
    guard let window = UIApplication.shared.keyWindow else {
        return
    }
    window.tintColor = color
}

class TintColorViewController: UIViewController {
    @IBOutlet weak var tintColorSegue: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let userDefaultColor = UserDefaults.standard.integer(forKey: TintColorKey)
        self.tintColorSegue.selectedSegmentIndex = userDefaultColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tintColorChanged(_ sender: Any) {
        let selectedIndex = self.tintColorSegue.selectedSegmentIndex
        
        UserDefaults.standard.set(selectedIndex, forKey: TintColorKey)
        
        guard let changedColor = TintColor(rawValue: selectedIndex)?.color else{
            return
        }
        applyTintColor(color: changedColor)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
