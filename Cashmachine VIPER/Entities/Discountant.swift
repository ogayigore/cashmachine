
import Foundation

class Discountant {
    private var descriptorArray = [DiscountedDescriptor]()
    
    required init(descriptorArray: [DiscountedDescriptor]) {
        self.descriptorArray = descriptorArray
    }
}

extension Discountant: Discounter {
    func calculateDiscount(for good: Discountable) -> Double {
        guard let discountItem = descriptorArray.first(where: {$0.itemId == good.itemId})
            else {
                return 0
        }
        return good.price * discountItem.discountValue
    }
}
