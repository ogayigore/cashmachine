//
//  Store.swift
//  Cashmachine VIPER
//
//  Created by Игорь Огай on 12/02/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import Foundation

let tradableDiscription = TradableDiscription(name: "Шоколад", originCountry: "Russia")
let tradableObject = TradableObject(idCode: 1, countType: .item, tradableDiscription: tradableDiscription)
let taxableObject = TaxableObject(priceValue: 100, type: .share, currentCountry: tradableDiscription.originCountry, fixType: .noType)
let discountableObject = DiscountableObject(itemId: tradableObject.idCode, price: taxableObject.priceValue)

let good = Good(tradable: tradableObject, taxable: taxableObject, discountable: discountableObject)

let tradableDiscription1 = TradableDiscription(name: "Водка 0.5", originCountry: "Russia")
let tradableObject1 = TradableObject(idCode: 2, countType: .item, tradableDiscription: tradableDiscription1)
let taxableObject1 = TaxableObject(priceValue: 500, type: .fix, currentCountry: tradableDiscription1.originCountry, fixType: .alcohol)
let discountableObject1 = DiscountableObject(itemId: tradableObject1.idCode, price: taxableObject1.priceValue)

let good1 = Good(tradable: tradableObject1, taxable: taxableObject1, discountable: discountableObject1)

let tradableDiscription2 = TradableDiscription(name: "Ватрушка", originCountry: "Russia")
let tradableObject2 = TradableObject(idCode: 3, countType: .item, tradableDiscription: tradableDiscription2)
let taxableObject2 = TaxableObject(priceValue: 30, type: .share, currentCountry: tradableDiscription2.originCountry, fixType: .noType)
let discountableObject2 = DiscountableObject(itemId: tradableObject2.idCode, price: taxableObject2.priceValue)

let good2 = Good(tradable: tradableObject2, taxable: taxableObject2, discountable: discountableObject2)

let tradableDiscription3 = TradableDiscription(name: "Сок 2л", originCountry: "Russia")
let tradableObject3 = TradableObject(idCode: 4, countType: .item, tradableDiscription: tradableDiscription3)
let taxableObject3 = TaxableObject(priceValue: 81, type: .share, currentCountry: tradableDiscription3.originCountry, fixType: .noType)
let discountableObject3 = DiscountableObject(itemId: tradableObject3.idCode, price: taxableObject3.priceValue)

let good3 = Good(tradable: tradableObject3, taxable: taxableObject3, discountable: discountableObject3)

let tradableDiscription4 = TradableDiscription(name: "Бананы", originCountry: "Ecuador")
let tradableObject4 = TradableObject(idCode: 5, countType: .weigth, tradableDiscription: tradableDiscription4)
let taxableObject4 = TaxableObject(priceValue: 70, type: .share, currentCountry: tradableDiscription4.originCountry, fixType: .noType)
let discountableObject4 = DiscountableObject(itemId: tradableObject4.idCode, price: taxableObject4.priceValue)

let good4 = Good(tradable: tradableObject4, taxable: taxableObject4, discountable: discountableObject4)
