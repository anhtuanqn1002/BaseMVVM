//
//  SampleViewModel.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 17/03/2023.
//

import Foundation
import Moya

final class SampleViewModel {
    let network: SampleAPI!
    
    init(network: SampleAPI = SampleAPI()) {
        self.network = network
    }
    
    func getFacts() {
        network.getFacts()
    }
}
