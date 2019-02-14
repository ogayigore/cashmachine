
import Foundation

class BillPrint {
    
}

extension BillPrint: BillPrinter {
    func printBill(bill: Billable) -> String {
        var outString = ""
        outString += "Наименование   Цена     Кол-во   Стоимость   Скидка   НДС\n"
        outString += "------------------------------------------------------------\n"
        
        for i in bill.positions {
            outString += "\( i.title)" + "         " + "\(i.price)" + "     " + "\(i.quantity)" + "\(i.units)" + "       " + "\(i.quantity * i.price)" + "    " + "\(i.discount * i.quantity)" + "    " + "\(i.tax * i.quantity)\n"
        }
        outString += "------------------------------------------------------------\n"
        outString += "Сумма НДС = \(bill.totalTax)\n"
        outString += "Сумма скидки = \(bill.totalDiscount)\n"
        outString += "Сумма = \(bill.totalSum)\n"
        outString += "ИТОГО = \(bill.totalSum - bill.totalDiscount + bill.totalTax)"
        return outString
    }
}
