//
//  RoomInfoCell.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 10. 18..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit

class RoomInfoCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
