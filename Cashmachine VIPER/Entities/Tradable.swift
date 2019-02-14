
import Foundation

enum CountType: String {
    case item = "шт"
    case weigth = "г"
    case liquid = "мл"
}

struct TradableDiscription {
    var name: String
    var originCountry: String
    var prettyPrinted: String {
        return name + "\n" + originCountry
    }
    
    init(name: String, originCountry: String) {
        self.name = name
        self.originCountry = originCountry
    }
}

protocol Tradable {
    var idCode: Int { get }
    var countType: CountType { get }
    var tradableDiscription: TradableDiscription { get }
}
