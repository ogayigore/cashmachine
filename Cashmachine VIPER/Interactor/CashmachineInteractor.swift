//
//  CashmachineInteractor.swift
//  Cashmachine VIPER
//
//  Created by Игорь Огай on 30/01/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import Foundation

class CashmachineInteractor {
    
    var interactorOutput: InteractorOutput!
    
    private let accountable: Accounter
    private let billPrinter: BillPrinter
    private let discounter: Discounter
    var existingGoods: [Tradable & Taxable & Discountable]
    var scanItems: [ScanItem]
    
    init(accountable: Accounter, billPrinter: BillPrinter, discounter: Discounter) {
        self.accountable = accountable
        self.billPrinter = billPrinter
        self.discounter = discounter
        existingGoods = [Tradable & Taxable & Discountable]()
        scanItems = [ScanItem]()
    }
}

// MARK: - Adding/removing existing goods

extension CashmachineInteractor {
    func register(good: Tradable & Taxable & Discountable) {
        existingGoods.append(good)
    }
    
    func unregister(good: Tradable & Taxable & Discountable) {
        guard let indexToRemove = existingGoods.firstIndex(where: {$0.itemId == good.itemId}) else {
            return
        }
        existingGoods.remove(at: indexToRemove)
    }
}

// MARK: - Scaner

extension CashmachineInteractor {
    func scan(items: [ScanItem]) -> String {
        var billPositions = [BillPosition]()
        var totalDiscount = 0.0
        var totalTax = 0.0
        var totalSum = 0.0
        
        for item in items {
            guard let registeredItem = existingGoods.first(where: {$0.itemId == item.itemId}) else {
                continue
            }
            
            let tax = accountable.calculateTax(forTaxable: registeredItem)
            
            let discount = discounter.calculateDiscount(for: registeredItem)
            let billPosition = BillPosition(title: (registeredItem as Tradable)
                .tradableDiscription.prettyPrinted,
                                            quantity: item.quantity,
                                            units: (registeredItem as Tradable).countType.rawValue,
                                            price: (registeredItem as Discountable).price,
                                            tax: tax,
                                            discount: discount)
            totalTax += tax * billPosition.quantity
            totalSum += registeredItem.priceValue * billPosition.quantity
            totalDiscount += discount * billPosition.quantity
            billPositions.append(billPosition)
        }
        
        let total = Total(billPositions: billPositions, discount: totalDiscount, tax: totalTax, sum: totalSum)
        return billPrinter.printBill(bill: total)
    }
}

extension CashmachineInteractor: InteractorInput {
    var output: InteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
    
    func addGood(codebar: Int) {
        var addedGood: Tradable & Taxable & Discountable = good
        for i in existingGoods {
            if codebar == i.idCode {
                let scanItem = ScanItem(itemId: i.idCode, quantity: 1)
                scanItems.append(scanItem)
                addedGood = i
            }
        }
        interactorOutput.added(good: addedGood)
    }
}
