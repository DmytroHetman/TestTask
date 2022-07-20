//
//  ViewController.swift
//  TestTask
//
//  Created by Dmytro Hetman on 18.07.2022.
//

import UIKit

class SummaryTableViewController: UIViewController {
    

    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - IBActions
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SummaryRepository.shared.fetchSummary {
            equipment, personnnel in
            SummaryRepository.shared.equipmentSummary = equipment
            SummaryRepository.shared.personnelSummary = personnnel
        }
        print("!!!personnel: \(SummaryRepository.shared.personnelSummary)")
        print("!!!equipment: \(SummaryRepository.shared.equipmentSummary)")

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }


}

extension SummaryTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Const.cellForReuseID, for: indexPath)
        
        return cell
    }
    
    
}

