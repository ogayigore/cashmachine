
import Foundation

struct DiscountedDescriptor {
    var itemId: Int
    var discountValue: Double
    
    init(itemId: Int, discountValue: Double) {
        self.itemId = itemId
        self.discountValue = discountValue
    }
}

protocol Discountable {
    var itemId: Int { get }
    var price: Double { get }
}

protocol Discounter {
    init(descriptorArray: [DiscountedDescriptor])
    func calculateDiscount(for good: Discountable) -> Double
}
