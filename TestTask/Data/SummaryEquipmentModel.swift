//
//  Summary.swift
//  TestTask
//
//  Created by Dmytro Hetman on 19.07.2022.
//

import Foundation

struct SummaryEquipmentModel: Decodable {
    
    let date: String
    let day: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let apc: Int
    let fieldArtillery: Int
    let mrl: Int
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let mobileSRBMSystem: Int?
    let greatestLossesDirection: String?
    var vehiclesAndFuelTanks: Int?
    let cruiseMissles: Int?
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case greatestLossesDirection = "greatest losses direction"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissles = "cruise missiles"
    }
    
    
}

extension SummaryEquipmentModel {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try values.decode(String.self, forKey: .date)
        if let dayString = try? values.decode(String.self, forKey: .day) {
            guard let dayInt = Int(dayString) else { fatalError() }
            self.day = dayInt
        } else {
            self.day = try values.decode(Int.self, forKey: .day)
        }
        self.aircraft = try values.decode(Int.self, forKey: .aircraft)
        self.helicopter = try values.decode(Int.self, forKey: .helicopter)
        self.tank = try values.decode(Int.self, forKey: .tank)
        self.apc = try values.decode(Int.self, forKey: .apc)
        self.fieldArtillery = try values.decode(Int.self, forKey: .fieldArtillery)
        self.mrl = try values.decode(Int.self, forKey: .mrl)
        
        if let drone = try? values.decode(Int.self, forKey: .drone) {
            self.drone = drone
        } else {
            self.drone = -1
        }
        if let navalShip = try? values.decode(Int.self, forKey: .navalShip) {
            self.navalShip = navalShip
        } else {
            self.navalShip = -1
        }
        if let antiAircraftWarfare = try? values.decode(Int.self, forKey: .antiAircraftWarfare) {
            self.antiAircraftWarfare = antiAircraftWarfare
        } else {
            self.antiAircraftWarfare = -1
        }
        if let specialEquipment = try? values.decode(Int.self, forKey: .specialEquipment) {
            self.specialEquipment = specialEquipment
        } else {
            self.specialEquipment = -1
        }
        if let mobileSRBMSystem = try? values.decode(Int.self, forKey: .mobileSRBMSystem) {
            self.mobileSRBMSystem = mobileSRBMSystem
        } else {
            self.mobileSRBMSystem = -1
        }
        if let greatestLossesDirection = try? values.decode(String.self, forKey: .greatestLossesDirection) {
            self.greatestLossesDirection = greatestLossesDirection
        } else {
            self.greatestLossesDirection = "no info"
        }
        self.militaryAuto = try? values.decode(Int.self, forKey: .militaryAuto)
        self.fuelTank = try? values.decode(Int.self, forKey: .fuelTank)
        if let vehiclesAndFuelTanks = try? values.decode(Int.self, forKey: .vehiclesAndFuelTanks) {
            self.vehiclesAndFuelTanks = vehiclesAndFuelTanks
        } else {
            if let militaryAuto = self.militaryAuto,
               let fuelTank = self.fuelTank {
                self.vehiclesAndFuelTanks = militaryAuto + fuelTank
            }
        }
        if let cruiseMissles = try? values.decode(Int.self, forKey: .cruiseMissles) {
            self.cruiseMissles = cruiseMissles
        } else {
            self.cruiseMissles = -1
        }
    }
    
    
}
