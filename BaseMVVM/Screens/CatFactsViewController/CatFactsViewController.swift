//
//  CatFactsViewController.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 05/03/2024.
//

import UIKit
import Combine

final class CatFactsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private var infoLabel: UILabel!
    @IBOutlet private var inputTextField: UITextField!
    @IBOutlet private var loadDataButton: UIButton!
    
    private var cancellables = Set<AnyCancellable>()
    private var viewModel = CatFactsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        demoLog()
        dataBinding()
    }
    
    @IBAction private func loadAction(_ sender: Any) {
        viewModel.getFacts()
    }
}

private extension CatFactsViewController {
    func dataBinding() {
        viewModel.$user.sink { [weak self] user in
            guard let self = self else { return }
            self.infoLabel.text = user
        }.store(in: &cancellables)
    }
    
    func demoLog() {
        log?.verbose("A verbose message, usually useful when working on a specific problem")
        log?.debug("A debug message")
        log?.info("An info message, probably useful to power users looking in console.app")
        log?.notice("A notice message")
        log?.warning("A warning message, may indicate a possible error")
        log?.error("An error occurred, but it's recoverable, just info about what happened")
        log?.severe("A severe error occurred, we are likely about to crash now")
        log?.alert("An alert error occurred, a log destination could be made to email someone")
        log?.emergency("An emergency error occurred, a log destination could be made to text someone")
        
        log?.debug {
            var total = 0
            for index in 0..<10 {
                total += index
            }

            return "Total of all receipts: \(total)"
        }
    }
}
