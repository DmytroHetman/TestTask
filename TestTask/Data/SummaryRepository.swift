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
                
                let summaryEquipmentOfDay = SummaryEquipment(
                    date: summaryEquipment.date,
                    day: summaryEquipment.day,
                    aircraft: summaryEquipment.aircraft,
                    helicopter: summaryEquipment.helicopter,
                    tank: summaryEquipment.tank,
                    apc: summaryEquipment.apc,
                    fieldArtillery: summaryEquipment.fieldArtillery,
                    mrl: summaryEquipment.mrl,
                    drone: summaryEquipment.drone,
                    navalShip: summaryEquipment.navalShip,
                    antiAircraftWarfare: summaryEquipment.antiAircraftWarfare,
                    specialEquipment: summaryEquipment.specialEquipment,
                    mobileSRBMSystem: summaryEquipment.mobileSRBMSystem,
                    greatestLossesDirection: summaryEquipment.greatestLossesDirection,
                    vehiclesAndFuelTanks: summaryEquipment.vehiclesAndFuelTanks,
                    cruiseMissles: summaryEquipment.cruiseMissles
                )
                
                return summaryEquipmentOfDay
            }
            
            let summaryPersonnelArray = summaryDataPersonnel.compactMap {
                summaryPersonnel -> SummaryPersonnel? in
                
                var powInfo: String = ""
                if let pow = summaryPersonnel.pow {
                    powInfo = pow == -1 ? "no info" : String(pow)
                }
                print(powInfo)
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
    
    func getSummaryData(from jsonFile: String) -> Data? {
        guard let path = Bundle.main.path(forResource: jsonFile, ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        else { return nil }
        return data
    }
}

