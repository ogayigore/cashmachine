//
//  Assembly.swift
//  Cashmachine VIPER
//
//  Created by Игорь Огай on 12/02/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import Foundation
import UIKit

class Assembly {
    func build () -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "main") as? ViewController else {
            return nil
        }
        
        let accountant = Accountant()
        let discountant = Discountant(descriptorArray: vc.arrayOfGoodsWithDiscount)
        let billPrint = BillPrint()
        
        
        let presenter = CashmachinePresenter()
        let interactor = CashmachineInteractor(accountable: accountant, billPrinter: billPrint, discounter: discountant)
        
        vc.viewOutput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = vc
        interactor.output = presenter
        vc.presenter = presenter
        presenter.cashmachineInteractor = interactor
        
        return vc
    }
}
