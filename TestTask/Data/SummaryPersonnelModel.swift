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

extension SummaryPersonnelModel {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try values.decode(String.self, forKey: .date)
        self.day = try values.decode(Int.self, forKey: .day)
        self.personnel = try values.decode(Int.self, forKey: .personnel)
        self.personnelAbout = try values.decode(String.self, forKey: .personnelAbout)
        if let pow = try? values.decode(Int?.self, forKey: .pow) {
            self.pow = pow
        } else {
            self.pow = -1
        }
    }
    
}
