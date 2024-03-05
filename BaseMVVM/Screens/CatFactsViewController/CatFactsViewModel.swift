//
//  SampleViewModel.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 17/03/2023.
//

import Foundation
import Moya

final class CatFactsViewModel: ViewModel {
    let network: CatFactsAPI!
    
    @Published var user: String = ""
    
    init(network: CatFactsAPI = CatFactsAPI()) {
        self.network = network
    }
    
    func getFacts() {
        network.getFacts().sink { completion in
            
        } receiveValue: { [weak self] catData in
            self?.user = catData.user ?? ""
        }.store(in: &cancellables)
    }
}

extension CatFactsViewModel: ViewModelTransformable {
    func transform(input: Input) -> Output {
        return Output(user: _user)
    }
    
    struct Input {
    }
    
    struct Output {
        let user: Published<String>
    }
}
