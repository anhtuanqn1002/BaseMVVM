//
//  BaseViewModel.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 05/03/2024.
//

import Combine

protocol ViewModelTransformable: AnyObject {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}

class ViewModel {
    var cancellables = Set<AnyCancellable>()
    
    deinit {
#if DEBUG
        print("\(String(describing: self)) deinit.")
#endif
    }
}
