//
//  SurveyTableVC.swift
//  Field Survey
//
//  Created by Taylor Snyder on 7/22/17.
//  Copyright © 2017 Taylor Snyder. All rights reserved.
//

import Foundation
import UIKit

class SurveyTableVC : UITableViewController
{
    var observationList: [SurveyParser.Observation] = []
    var currentObservationIndex = 0
    
    override func viewDidLoad()
    {
        observationList = SurveyParser(jsonPath: "field_observations").observations
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        currentObservationIndex = indexPath.row
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Observation", for: indexPath) as! SurveyTVC
        let row = indexPath.row

        cell.ObservationNameLabel.text = observationList[row].title
        cell.DiscoveryTimeLabel.text = observationList[row].date
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return observationList.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is SurveyTVC
        {
            let destinationVC = segue.destination as! ObservationVC
            print("before \(currentObservationIndex)")
            destinationVC.currentObservationIndex = self.currentObservationIndex
        }
    }
}
