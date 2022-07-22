//
//  SummaryTableViewCell.swift
//  TestTask
//
//  Created by Dmytro Hetman on 18.07.2022.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var date: UILabel!
    @IBOutlet private weak var day: UILabel!
    @IBOutlet private weak var personnelLosses: UILabel!
    @IBOutlet private weak var pow: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    
    // MARK: - IBActions
    
    // MARK: - Cell config
    func config(from summaryPersonnelData: SummaryPersonnel) {
        
        self.cellView.layer.cornerRadius = 15
        self.cellView.layer.masksToBounds = true
        self.date.text = "🗓 \(summaryPersonnelData.date)"
        self.day.text = "🌍 Day: \(String(summaryPersonnelData.day))"
        self.personnelLosses.text = "☠️ Personnel: \(summaryPersonnelData.personnel)"
        self.pow.text = "🏳 POW: \(summaryPersonnelData.pow)"
        self.arrowImageView.image = UIImage(systemName: "chevron.forward")
        
    }
    
}
