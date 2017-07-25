//
//  ObservationVC.swift
//  Field Survey
//
//  Created by Taylor Snyder on 7/22/17.
//  Copyright © 2017 Taylor Snyder. All rights reserved.
//

import Foundation
import UIKit

class ObservationVC : UIViewController
{
    var currentObservationIndex = 0
    
    @IBOutlet weak var IconImage: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DiscoverTimeLabel: UILabel!
    @IBOutlet weak var DescLabel: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        let selectedObservation = SurveyParser(jsonPath: "field_observations").observations[currentObservationIndex]

        NameLabel.text = selectedObservation.title
        DiscoverTimeLabel.text = selectedObservation.date
        DescLabel.text = selectedObservation.desc
        //image declaration
    }
}
