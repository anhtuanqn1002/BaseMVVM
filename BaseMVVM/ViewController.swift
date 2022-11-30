//
//  ViewController.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 12/11/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        log.verbose("A verbose message, usually useful when working on a specific problem")
        log.debug("A debug message")
        log.info("An info message, probably useful to power users looking in console.app")
        log.notice("A notice message")
        log.warning("A warning message, may indicate a possible error")
        log.error("An error occurred, but it's recoverable, just info about what happened")
        log.severe("A severe error occurred, we are likely about to crash now")
        log.alert("An alert error occurred, a log destination could be made to email someone")
        log.emergency("An emergency error occurred, a log destination could be made to text someone")
        
        log.debug {
            var total = 0
            for index in 0..<10 {
                total += index
            }

            return "Total of all receipts: \(total)"
        }
    }
}
