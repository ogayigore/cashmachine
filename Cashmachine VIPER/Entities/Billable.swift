
import Foundation

struct BillPosition {
    var title: String
    var quantity: Double
    var units: String
    var price: Double
    var tax: Double
    var discount: Double
    
    init(title: String, quantity: Double, units: String, price: Double, tax: Double, discount: Double) {
        self.title = title
        self.quantity = quantity
        self.units = units
        self.price = price
        self.tax = tax
        self.discount = discount
    }
}

protocol Billable {
    var positions: [BillPosition] { get }
    var totalDiscount: Double { get }
    var totalTax: Double { get }
    var totalSum: Double { get }
}

protocol BillPrinter {
    func printBill(bill: Billable) -> String
}
