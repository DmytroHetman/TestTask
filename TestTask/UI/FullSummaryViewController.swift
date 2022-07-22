//
//  FullSummaryViewController.swift
//  TestTask
//
//  Created by Dmytro Hetman on 21.07.2022.
//

import UIKit

class FullSummaryViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var detailsScrollView: UIScrollView!
    @IBOutlet private weak var detailsView: UIView!
    @IBOutlet private weak var generalView: UIView!
    @IBOutlet private weak var personnelView: UIView!
    @IBOutlet private weak var equipmentView: UIView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var personnelLabel: UILabel!
    @IBOutlet private weak var powLabel: UILabel!
    @IBOutlet private weak var aircraftLabel: UILabel!
    @IBOutlet private weak var helicopterLabel: UILabel!
    @IBOutlet private weak var tankLabel: UILabel!
    @IBOutlet private weak var apcLabel: UILabel!
    @IBOutlet private weak var fieldArtilleryLabel: UILabel!
    @IBOutlet private weak var mrlLabel: UILabel!
    @IBOutlet private weak var droneLabel: UILabel!
    @IBOutlet private weak var navalShipLabel: UILabel!
    @IBOutlet private weak var antiAircraftWarfareLabel: UILabel!
    @IBOutlet private weak var specialEquipmentLabel: UILabel!
    @IBOutlet private weak var vehiclesAndFuelTanksLabel: UILabel!
    @IBOutlet private weak var mobileSRBMSystemLabel: UILabel!
    @IBOutlet private weak var cruiseMisslesLabel: UILabel!
    @IBOutlet private weak var greatestLossesDirectionLabel: UILabel!
    
    
    
    // MARK: - Variables
    var dayToShow: Int?
    var personnel: Int?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let dayToShow = self.dayToShow,
              let personnel = self.personnel
        else { return }
        config(from: dayToShow, numOfPersonnel: personnel)
        self.generalView.layer.masksToBounds = true
        self.personnelView.layer.masksToBounds = true
        self.equipmentView.layer.masksToBounds = true
        self.generalView.layer.cornerRadius = 15
        self.personnelView.layer.cornerRadius = 15
        self.equipmentView.layer.cornerRadius = 15
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.detailsScrollView.contentSize = CGSize(width: self.detailsView.frame.size.width, height: self.detailsView.frame.size.height - 150)
    }
    

    func config(from day: Int, numOfPersonnel: Int)  {
        
        guard let dayDetailsToShowEquipment = SummaryRepository.shared.equipmentSummary.first(where: { $0.day == day }),
              let dayDetailsToShowPersonnel = SummaryRepository.shared.personnelSummary.first(where: { $0.day == day })
        else { return }
        self.dateLabel.text = "🗓 Date: \(dayDetailsToShowEquipment.date)"
        self.dayLabel.text = "🌍 Day: \(dayDetailsToShowEquipment.day)"
        
        self.personnelLabel.text = "☠️ Personnel: \(dayDetailsToShowPersonnel.personnel)"
        self.powLabel.text = "🏳 POW: \(dayDetailsToShowPersonnel.pow)"
        
        self.aircraftLabel.text = "Aircraft: \(dayDetailsToShowEquipment.aircraft)"
        self.droneLabel.text = "Drone: \(dayDetailsToShowEquipment.drone)"
        self.helicopterLabel.text = "Helicopter: \(dayDetailsToShowEquipment.helicopter)"
        self.cruiseMisslesLabel.text = "Cruise Missles: \(dayDetailsToShowEquipment.cruiseMissles)"
        
        self.tankLabel.text = "Tank: \(dayDetailsToShowEquipment.tank)"
        self.apcLabel.text = "APC: \(dayDetailsToShowEquipment.apc)"
        self.fieldArtilleryLabel.text = "Field Artillery: \(dayDetailsToShowEquipment.fieldArtillery)"
        self.mrlLabel.text = "MRL: \(dayDetailsToShowEquipment.mrl)"
        self.antiAircraftWarfareLabel.text = "Anti-aircraft Warfare: \(dayDetailsToShowEquipment.antiAircraftWarfare)"
        self.vehiclesAndFuelTanksLabel.text = "Vehicles and Fuel Tanks: \(dayDetailsToShowEquipment.vehiclesAndFuelTanks)"
        self.mobileSRBMSystemLabel.text = "Mobile SRBM System: \(dayDetailsToShowEquipment.mobileSRBMSystem)"
        self.specialEquipmentLabel.text = "Special Equipment: \(dayDetailsToShowEquipment.specialEquipment)"
        
        self.navalShipLabel.text = "Naval Ship: \(dayDetailsToShowEquipment.navalShip)"
        
        self.greatestLossesDirectionLabel.text = "Greatest losses direction: \n\(dayDetailsToShowEquipment.greatestLossesDirection)"
    }

}
