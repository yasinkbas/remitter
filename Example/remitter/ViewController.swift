//
//  ViewController.swift
//  remitter
//
//  Created by yasinkbas on 10/22/2019.
//  Copyright (c) 2019 yasinkbas. All rights reserved.
//

import UIKit
import remitter

class ViewController: UIViewController {
    
    var remitter: Remitter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initial remitter in a view
//        remitter = Remitter(in: view, offsetType: .zero, cellImage: UIImage(named: "image")!)
        //        remitter = Remitter(in: view, cellImage: UIImage(named: "image")!)
        //        remitter = Remitter(in: view, offsetType: .normal, cellImage: UIImage(named: "image")!)
                remitter = Remitter(in: view, offsetType: .normal, layerPosition: .zero, layerShape: .rectangle, cellImage: UIImage(named: "image")!, birthRate: 800, lifetime: 6, color: nil, velocity: 100, velocityRange: 400, emissionRange: 10, scale: 0.3)
        
        // stops remitter immediately
        //        remitter.stop(animated: true)
        
        // stops remitter after given seconds
        //        remitter.stopAfter(seconds: 10, animated: true)
        
        // resume remitter
        //        remitter.resume(animated: true)
        
        // resume remitter after given seconds
        //        remitter.resumeAfter(seconds: 15, animated: true)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

