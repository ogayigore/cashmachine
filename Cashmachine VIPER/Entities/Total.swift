
import Foundation

class Total {
    private let billPositions: [BillPosition]
    private let discount: Double
    private let tax: Double
    private let sum: Double
    
    
    init(billPositions: [BillPosition], discount: Double, tax: Double, sum: Double) {
        self.billPositions = billPositions
        self.discount = discount
        self.tax = tax
        self.sum = sum
    }
}

extension Total: Billable {
    var positions: [BillPosition] {
        return billPositions
    }
    
    var totalDiscount: Double {
        return discount
    }
    
    var totalTax: Double {
        return tax
    }
    
    var totalSum: Double {
        return sum
    }
}
