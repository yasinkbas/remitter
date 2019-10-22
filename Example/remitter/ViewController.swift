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
        
        remitter = Remitter(in: view, offsetType: .normal, cellImage: UIImage(named: "image")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

