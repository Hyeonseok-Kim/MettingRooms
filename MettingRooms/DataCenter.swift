//
//  DataCenter.swift
//  MettingRooms
//
//  Created by 김현석 on 2017. 8. 16..
//  Copyright © 2017년 Kimhyeonseok. All rights reserved.
//

import Foundation


let dataCenter:DataCenter = DataCenter()

class DataCenter {
    var branches:[Branch] = []
    
    
    init() {
        let JejuRoom = MeetingRoom(name:"Jeju/제주", capacity: 4)
        let BermudaRoom = MeetingRoom(name:"Bermuda/버뮤다", capacity: 6)
        let SicilyRoom = MeetingRoom(name:"Sicily/시실리", capacity: 6)
        let MoldivRoom = MeetingRoom(name:"Moldiv/몰디브", capacity: 10)
        
        
        let meetingRoomService = Service(name: "회의실예약")
        let visitorService = Service(name: "방문자예약")
        let vehicleService = Service(name: "차량예약")
        let deskService = Service(name: "데스크예약")
        
        meetingRoomService.items = [JejuRoom, BermudaRoom, SicilyRoom, MoldivRoom]
        
        let pangyoBranch = Branch(name: "역삼점")
        let samsungBranch = Branch(name: "삼성점")
        let yeoksamBranch = Branch(name: "판교점")
        let sinrimBranch = Branch(name: "신림점")
        let songdoBranch = Branch(name: "송도점")
        let anamBranch = Branch(name: "안암점")
        
        pangyoBranch.services = [meetingRoomService, visitorService, vehicleService, deskService]
        
        branches += [pangyoBranch, samsungBranch, yeoksamBranch, sinrimBranch, songdoBranch, anamBranch]
    }
    
}

class Branch {
    let name:String
    var services:[Service]?
    
    init(name:String) {
        self.name = name
    }
}

class Service {
    let name:String
    var items:[MeetingRoom]?
    
    init(name:String) {
        self.name = name
    }
}

class MeetingRoom {
    let name:String
    var capacity:Int
    
    init(name:String, capacity:Int){
        self.name = name
        self.capacity = capacity
    }
}
