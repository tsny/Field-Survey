//
//  SurveyParser.swift
//  Field Survey
//
//  Created by Taylor Snyder on 7/23/17.
//  Copyright © 2017 Taylor Snyder. All rights reserved.
//

import Foundation

struct SurveyParser
{
    struct Observation
    {
        var classification = ""
        var title = ""
        var desc = ""
        var date = ""
    }
    
    var observations: [Observation] = []
    
    init(jsonPath: String)
    {
        if let path = Bundle.main.path(forResource: jsonPath, ofType: "json")
        {
            do
            {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do
                {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let obs : [NSDictionary] = jsonResult["observations"] as? [NSDictionary]
                    {
                        for entry: NSDictionary in obs
                        {
                            var newObservation = Observation()
                            
                            for (name, value) in entry
                            {
                                switch(name as! String)
                                {
                                    case "classification":
                                        newObservation.classification = value as! String
                                    case "title":
                                        newObservation.title = value as! String
                                    case "description":
                                        newObservation.desc = value as! String
                                    case "date":
                                        newObservation.date = value as! String
                                    default:
                                        break
                                }
                            }
                            
                            observations.append(newObservation)
                        }
                    }
                } catch {}
            } catch {}
        }
    }
        
}
