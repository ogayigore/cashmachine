//
//  ViewController.swift
//  Cashmachine VIPER
//
//  Created by Игорь Огай on 30/01/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var output: ViewOutput!
    var presenter: CashmachinePresenter!
    
    var arrayOfGoodsWithDiscount = [DiscountedDescriptor(itemId: 1, discountValue: 0.5)]
    
    @IBOutlet weak var codebarTextField: UITextField!
    @IBOutlet weak var billTextView: UITextView!
    
    @IBAction func scanButton(_ sender: Any) {
        guard let codebar = Int(codebarTextField.text!) else {
            return
        }
        
        output.didCodebarEnter(codebar: codebar)
    }
    
    @IBAction func printBillButton(_ sender: Any) {
        let bill = presenter.cashmachineInteractor.scan(items: presenter.cashmachineInteractor.scanItems)
        billTextView.text = bill
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.cashmachineInteractor.register(good: good)
        presenter.cashmachineInteractor.register(good: good1)
        presenter.cashmachineInteractor.register(good: good2)
        presenter.cashmachineInteractor.register(good: good3)
        presenter.cashmachineInteractor.register(good: good4)
    }
}

extension ViewController: ViewInput {
    var viewOutput: ViewOutput {
        get {
            return output
        }
        set {
            output = newValue
        }
    }
    
    func display(good: Discountable & Taxable & Tradable) {
        billTextView.text = good.tradableDiscription.name
    }
}
