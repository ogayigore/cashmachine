//
//  CashmachineInteractorProtocols.swift
//  Cashmachine VIPER
//
//  Created by Игорь Огай on 12/02/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import Foundation

protocol InteractorOutput {
    func added(good: Discountable & Taxable & Tradable)
}

protocol InteractorInput {
    var output: InteractorOutput { get set }
    func addGood(codebar: Int)
}
