//
//  SummaryRepository.swift
//  TestTask
//
//  Created by Dmytro Hetman on 19.07.2022.
//

import Foundation
import UIKit

class SummaryRepository {
    
    static let shared = SummaryRepository()
    
    var equipmentSummary: [SummaryEquipment] = []
    var personnelSummary: [SummaryPersonnel] = []
    
    private init() { }
    
    func fetchSummary(fetch: @escaping ([SummaryEquipment], [SummaryPersonnel]) -> Void) {
        
        guard let equipmentData = getSummaryData(from: Const.equipmentJSON),
              let personnelData = getSummaryData(from: Const.personnelJSON)
        else { fatalError() }
        
        do {
            let summaryDataEquipment = try JSONDecoder().decode([SummaryEquipmentModel].self, from: equipmentData)
            let summaryDataPersonnel = try JSONDecoder().decode([SummaryPersonnelModel].self, from: personnelData)
            
            let summaryEquipmentArray = summaryDataEquipment.compactMap {
                summaryEquipment -> SummaryEquipment? in
                
                let droneString = unwrapEquipment(from: summaryEquipment.drone)
                let navalShipString = unwrapEquipment(from: summaryEquipment.navalShip)
                let antiAircraftWarfareString = unwrapEquipment(from: summaryEquipment.antiAircraftWarfare)
                let vehiclesAndFuelTanksString = unwrapEquipment(from: summaryEquipment.vehiclesAndFuelTanks)
                let mobilesSRBMSystemString = unwrapEquipment(from: summaryEquipment.mobileSRBMSystem)
                let cruiseMisslesString = unwrapEquipment(from: summaryEquipment.cruiseMissles)
                let specialEquipmentString = unwrapEquipment(from: summaryEquipment.specialEquipment)
                
                let summaryEquipmentOfDay = SummaryEquipment(
                    date: summaryEquipment.date,
                    day: summaryEquipment.day,
                    aircraft: summaryEquipment.aircraft,
                    helicopter: summaryEquipment.helicopter,
                    tank: summaryEquipment.tank,
                    apc: summaryEquipment.apc,
                    fieldArtillery: summaryEquipment.fieldArtillery,
                    mrl: summaryEquipment.mrl,
                    drone: droneString,
                    navalShip: navalShipString,
                    antiAircraftWarfare: antiAircraftWarfareString,
                    specialEquipment: specialEquipmentString,
                    mobileSRBMSystem: mobilesSRBMSystemString,
                    greatestLossesDirection: summaryEquipment.greatestLossesDirection ?? "",
                    vehiclesAndFuelTanks: vehiclesAndFuelTanksString,
                    cruiseMissles: cruiseMisslesString
                )
                
                return summaryEquipmentOfDay
            }
            
            let summaryPersonnelArray = summaryDataPersonnel.compactMap {
                summaryPersonnel -> SummaryPersonnel? in
                
                var powInfo = ""
                if let pow = summaryPersonnel.pow {
                    powInfo = pow == -1 ? "no info" : String(pow)
                }
                
                let summaryPersonnelOfDay = SummaryPersonnel(
                    date: summaryPersonnel.date,
                    day: summaryPersonnel.day,
                    personnel: summaryPersonnel.personnel,
                    personnelAbout: summaryPersonnel.personnelAbout,
                    pow: powInfo
                )
                
                return summaryPersonnelOfDay
            }
            
            fetch(summaryEquipmentArray, summaryPersonnelArray)
            
        } catch {
            print("Unexpected error: \(error).")
        }
        
    }
    
    private func getSummaryData(from jsonFile: String) -> Data? {
        guard let path = Bundle.main.path(forResource: jsonFile, ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        else { return nil }
        return data
    }
    
    private func unwrapEquipment(from equip: Int?) -> String {
        var equipment = ""
        if let unwrappedItem = equip {
            equipment = unwrappedItem == -1 ? "no info" : String(unwrappedItem)
        }
        return equipment
    }
}

