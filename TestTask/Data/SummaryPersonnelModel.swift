//
//  SummaryPersonnel.swift
//  TestTask
//
//  Created by Dmytro Hetman on 19.07.2022.
//

import Foundation

struct SummaryPersonnelModel: Codable {
    
    let date: String
    var day: Int 
    let personnel: Int
    let personnelAbout: String
    let pow: Int?
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case personnel
        case personnelAbout = "personnel*"
        case pow = "POW"
    }
    
}
