//
//  Portofolio.swift
//  portofolio
//
//  Created by Renotech ID on 17/10/23.
//

import Foundation

struct Chart: Codable{
    var type: String?
    var data : [ChartData]?
    
    
}
struct ChartData: Codable{
    var label: String?
    var percentage:String?
    var data:[Transaction]?
    var month:[Int]?
}

struct Transaction:Codable{
    var trx_date:String?
    var nominal:Int?
}
