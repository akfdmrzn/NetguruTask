//
//  Payment.swift
//  NetguruTask
//
//  Created by Akif Demirezen on 18.02.2022.
//

import UIKit

class Payment{
    
    var amount : Int?
    var currency : String?
    
    init(){}
    
    init(amount : Int,currency : String){
        self.amount = amount
        self.currency = currency
    }
}
