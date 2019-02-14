
import Foundation

enum TaxType {
    case fix
    case share
}

enum FixType: Int {
    case noType = 0
    case sigarettes = 1
    case alcohol = 2
}

protocol Taxable {
    var priceValue: Double { get }
    var type: TaxType { get }
    var currentCountry: String { get }
    var fixType: FixType { get }
}

protocol Accounter {
    func calculateTax(forTaxable tax: Taxable) -> Double
}
