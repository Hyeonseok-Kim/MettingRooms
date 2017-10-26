//
//  meetingRoomInfo_Cell.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 10. 26..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit

class meetingRoomInfo_Cell: UITableViewCell {

    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var informationValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
