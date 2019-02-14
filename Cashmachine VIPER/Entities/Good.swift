
import Foundation

class Good {
    private let tradable: Tradable
    private let taxable: Taxable
    private let discountable: Discountable
    
    init(tradable: Tradable, taxable: Taxable, discountable: Discountable) {
        self.tradable = tradable
        self.taxable = taxable
        self.discountable = discountable
    }
}

extension Good: Tradable {
    var idCode: Int {
        return tradable.idCode
    }
    
    var countType: CountType {
        return tradable.countType
    }
    
    var tradableDiscription: TradableDiscription {
        return tradable.tradableDiscription
    }
}

extension Good: Taxable {
    var priceValue: Double {
        return taxable.priceValue
    }
    
    var type: TaxType {
        return taxable.type
    }
    
    var currentCountry: String {
        return taxable.currentCountry
    }
    
    var fixType: FixType {
        return taxable.fixType
    }
}

extension Good: Discountable {
    var itemId: Int {
        return discountable.itemId
    }
    
    var price: Double {
        return discountable.price
    }
}

struct TradableObject: Tradable {
    var idCode: Int
    var countType: CountType
    var tradableDiscription: TradableDiscription
    
    init(idCode: Int, countType: CountType, tradableDiscription: TradableDiscription) {
        self.idCode = idCode
        self.countType = countType
        self.tradableDiscription = tradableDiscription
    }
}

struct BillableObject: Billable {
    var positions: [BillPosition]
    var totalDiscount: Double
    var totalTax: Double
    var totalSum: Double
    
    init(positions: [BillPosition], totalDiscount: Double, totalTax: Double, totalSum: Double) {
        self.positions = positions
        self.totalDiscount = totalDiscount
        self.totalTax = totalTax
        self.totalSum = totalSum
    }
}

struct TaxableObject: Taxable {
    var priceValue: Double
    var type: TaxType
    var currentCountry: String
    var fixType: FixType
    
    init(priceValue: Double, type: TaxType, currentCountry: String, fixType: FixType) {
        self.priceValue = priceValue
        self.type = type
        self.currentCountry = currentCountry
        self.fixType = fixType
    }
}

struct DiscountableObject: Discountable {
    var itemId: Int
    var price: Double
    
    init(itemId: Int, price: Double) {
        self.itemId = itemId
        self.price = price
    }
}
