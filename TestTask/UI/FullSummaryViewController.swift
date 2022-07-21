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
//        self.detailsScrollView.addSubview(detailsView)
//        self.detailsScrollView.contentSize = detailsView.frame.size
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
        guard let dayDetailsToShow = SummaryRepository.shared.equipmentSummary.first(where: { $0.day == day }) else { return }
        
//        self.detailsLabel.text = "🌍 Day: \(dayDetailsToShow.day)\n     ☠️ Personnel: \(numOfPersonnel)\n     🚗 MRL: \(dayDetailsToShow.mrl)"
        
//        print(day)
    }

}
