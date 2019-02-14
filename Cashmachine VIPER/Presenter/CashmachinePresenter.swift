//
//  CashmachinePresenter.swift
//  Cashmachine VIPER
//
//  Created by Игорь Огай on 30/01/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import Foundation

class CashmachinePresenter {
    
    var view: ViewInput!
    var interactor: InteractorInput!
    var output: PresenterOutput!
    var cashmachineInteractor: CashmachineInteractor!
    
}

extension CashmachinePresenter: PresenterInput {
    var viewInput: ViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var presenterOutput: PresenterOutput {
        get {
            return output
        }
        set {
            output = newValue
        }
    }
    
    var interactorInput: InteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}

extension CashmachinePresenter: InteractorOutput {
    func added(good: Discountable & Taxable & Tradable) {
        view.display(good: good)
    }
}

extension CashmachinePresenter: ViewOutput {
    func didCodebarEnter(codebar: Int) {
        interactor.addGood(codebar: codebar)
    }
}
