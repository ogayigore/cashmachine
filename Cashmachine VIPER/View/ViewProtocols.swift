//
//  ViewProtocols.swift
//  Cashmachine VIPER
//
//  Created by Игорь Огай on 12/02/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import Foundation

protocol ViewOutput {
    func didCodebarEnter(codebar: Int)
}

protocol ViewInput {
    var viewOutput: ViewOutput { get set }
    func display(good: Discountable & Taxable & Tradable)
}
