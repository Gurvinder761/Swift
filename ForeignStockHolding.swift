//
//  ForeignStockHolding.swift
//  Help
//
//  Created by Tej on 31/10/20.
//

import Foundation

class ForeignStockHolding: StockHolding {
    var conversionRate :Double
    init(purchasePrice : Double, currentPrice : Double, numberOfShares : Int,companyName : String, conversionRate: Double) {
        self.conversionRate = conversionRate
        super.init(purchasePrice: purchasePrice, currentPrice: currentPrice, numberOfShares: numberOfShares, companyName: companyName)
        description = "Company's Name = \(companyName) \nCurrent Share Price = \(currentPrice)  \nPurchasing Share Price = \(purchasePrice) \nNumber Of Shares = \(numberOfShares) \nStock Value = \(valueInDollars()) \nConversion Rate: \(self.conversionRate)]\n"
        }

    override func costInDollars() -> Double {
        return super.costInDollars() * conversionRate
    }
    override func valueInDollars() -> Double {
        return super.valueInDollars() * conversionRate
    }
    
}
