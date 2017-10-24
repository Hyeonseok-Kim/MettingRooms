//
//  RoomInfoCell.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 10. 18..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit

class RoomInfoCell: UITableViewCell {

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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
