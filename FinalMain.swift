//
//  FinalMain.swift
//  Help
//
//  Created by Tej on 31/10/20.
//

import Foundation
class FinalMain {
    var arrayOfStocks = [StockHolding]()
    var mainArrayOfUserStocks = [StockHolding]()
    
    internal func TaskOne() {
        let stock1 =  StockHolding(purchasePrice: 100, currentPrice: 200, numberOfShares: 20, companyName: "Tez Corp");
        let stock2 =  StockHolding(purchasePrice: 200, currentPrice: 300, numberOfShares: 10, companyName: "Apple");
        let stock3 =  StockHolding(purchasePrice: 400, currentPrice: 300, numberOfShares: 40, companyName: "PetroChina");
        
        arrayOfStocks.append(stock1)
        arrayOfStocks.append(stock2)
        arrayOfStocks.append(stock3)
        print("--------->>>> Before Sort <<<<--------")
        displayAllStocks(stocks: arrayOfStocks)

        arrayOfStocks.sort { (s1, s2) -> Bool in
            return s1.companyName < s2.companyName
        }
        print("--------->>>> After Sort <<<<--------")
        displayAllStocks(stocks: arrayOfStocks)
    }
        
    
    internal func TaskTwo(){
        let stock5 = ForeignStockHolding(purchasePrice: 17.5, currentPrice: 25, numberOfShares: 50, companyName: "Ping An Insurance ", conversionRate: 55.5)
        let stock4 = ForeignStockHolding(purchasePrice: 100, currentPrice: 100, numberOfShares: 1, companyName: "China Mobile Ltd", conversionRate: 55);
        
        arrayOfStocks.append(stock4)
        arrayOfStocks.append(stock5)
        print("--------->>>> Before Sort <<<<--------")
        displayAllStocks(stocks: arrayOfStocks)
        arrayOfStocks.sort { (s1, s2) -> Bool in
            return s1.companyName > s2.companyName
        }
        print("--------->>>> After Sort <<<<--------")
        displayAllStocks(stocks: arrayOfStocks)
    }
    
    internal func TaskThree(){
        print("Enter the number of stocks between 1 and 8")
        let numberOfStocks  = readIntFromUser()
        for i in 0..<numberOfStocks{
            print("Enter type of stock: \n1 - Local Stock  2 - Foreign Stock")
            let type  = readIntFromUser()
            print("Enter Information for Stock \(i+1)")
            
            print("Stock Name: ")
            let companyName = readStringFromUser()
            
            print("Number Of Shares Purchased: ");
            let numberOfShares = readIntFromUser()
            
            print("Purchased Share Price: ");
            let purchasePrice = Double(readIntFromUser())
            
            print("Current Share Price: ");
            let currentPrice = Double(readIntFromUser())
            if type == 1 {
                let stockHolding =  StockHolding(purchasePrice: purchasePrice, currentPrice: currentPrice, numberOfShares: numberOfShares, companyName: companyName)
                mainArrayOfUserStocks.append(stockHolding)
            }
            else if type == 2 {
                print("Conversion Rate - ")
                let conversionRate = Double(readIntFromUser())
                let stockHolding =  ForeignStockHolding(purchasePrice: purchasePrice, currentPrice: currentPrice, numberOfShares: numberOfShares, companyName: companyName, conversionRate: conversionRate)
                mainArrayOfUserStocks.append(stockHolding)
            }
            
        }
        menu()
    }
    fileprivate func menu(){
        print("---------->>>> MENU <<<<-----------")
        let mainMenu = "\n1)    Display stock information with the lowest value\n" +
            "2)    Display stock with the highest value\n" +
            "3)    Display the most profitable stock\n" +
            "4)    Display the least profitable stock\n" +
            "5)    List all stocks sorted by company name (A-Z)\n" +
            "6)    List all stocks sorted from the lowest value to the highest value\n" +
            "7)    Exit\n" + "Enter your choice....."

        print(mainMenu)
        let choice = readIntFromUser()
        switch choice {
        case 1,6:
            mainArrayOfUserStocks.sort { (s1, s2) -> Bool in
                return s1.valueInDollars() < s2.valueInDollars()
            }
        case 2:
            mainArrayOfUserStocks.sort { (s1, s2) -> Bool in
                return s1.valueInDollars() > s2.valueInDollars()
            }
        case 3:
            mainArrayOfUserStocks.sort { (s1, s2) -> Bool in
                return (s1.valueInDollars() - s1.costInDollars()) > (s2.valueInDollars() - s2.costInDollars())
            }
        case 4:
            mainArrayOfUserStocks.sort { (s1, s2) -> Bool in
                return (s1.valueInDollars() - s1.costInDollars()) < (s2.valueInDollars() - s2.costInDollars())
            }
        case 5:
            mainArrayOfUserStocks.sort { (s1, s2) -> Bool in
                return s1.companyName < s2.companyName
            }
        case 7:
            exit(0)
        default:
            print("Enter valid choice")
            menu()
            return
        }
        displayAllStocks(stocks: mainArrayOfUserStocks)
        menu()
    }
    
    fileprivate func displayAllStocks(stocks:[StockHolding]){
        for i in 0..<stocks.count{
            print(stocks[i].description)
        }
    }
    fileprivate  func readIntFromUser() -> Int{
        if let input = readLine() {
            if let intInput = Int(input){
                return intInput
            }
            else{
                print("Wrong input.. Integer only allowed.!")
                return readIntFromUser()
            }
        }
        else{
            return readIntFromUser()
        }
    }
    fileprivate func readStringFromUser() -> String{
        if let input = readLine() {
            return input
        }
        else{
            return readStringFromUser()
        }
    }
}
