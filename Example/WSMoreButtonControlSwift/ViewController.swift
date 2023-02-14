//
//  ViewController.swift
//  WSMoreButtonControlSwift
//
//  Created by WebsoftProfession on 02/14/2023.
//  Copyright (c) 2023 WebsoftProfession. All rights reserved.
//

import UIKit
import WSMoreButtonControlSwift

class ViewController: UIViewController {

    @IBOutlet weak var moreControl: WSMoreButtonControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        moreControl.tintColor = .black
//        moreControl.style = .stroke
        moreControl.moreClicked = { isOpen in
            print("open: \(isOpen)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

