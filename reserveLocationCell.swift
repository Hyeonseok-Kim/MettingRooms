//
//  reserveLocationCell.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 10. 11..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import UIKit

class reserveLocationCell: UITableViewCell {
    
    @IBOutlet weak var locationText: UILabel!
    
    @IBOutlet weak var capacityValue: UILabel!
    
    @IBOutlet weak var basicFacilities: UILabel!
    
    @IBOutlet weak var applicableEquipments: UILabel!
    
    @IBOutlet weak var equipments: UILabel!
    
    @IBOutlet weak var characteristic: UILabel!
    
    @IBOutlet weak var precautions: UILabel!
    
    @IBOutlet weak var notice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
