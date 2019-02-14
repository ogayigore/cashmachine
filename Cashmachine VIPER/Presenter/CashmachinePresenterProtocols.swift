//
//  CashmachinePresenterProtocols.swift
//  Cashmachine VIPER
//
//  Created by Игорь Огай on 12/02/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import Foundation

protocol PresenterOutput {
    func addGood(codebar: Int)
}

protocol PresenterInput {
    var viewInput: ViewInput { get set }
    var presenterOutput: PresenterOutput { get set }
    var interactorInput: InteractorInput { get set }
    
    func added(good: Discountable & Taxable & Tradable)
}
