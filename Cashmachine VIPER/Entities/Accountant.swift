
import Foundation

//MARK: - Empty

class Accountant {
    
}

extension Accountant: Accounter {
    func calculateTax(forTaxable tax: Taxable) -> Double {
        var taxValue = 0.0
        if tax.type == .fix {
            if tax.fixType == .alcohol {
                taxValue = 100
            } else if tax.fixType == .sigarettes {
                taxValue = 50
            } else if tax.fixType == .noType {
                taxValue = 0
            }
        } else if tax.type == .share {
            if tax.currentCountry == "Russia" {
                taxValue = tax.priceValue * 0.1
            } else {
                taxValue = tax.priceValue * 0.2
            }
        }
        return taxValue
    }
}
