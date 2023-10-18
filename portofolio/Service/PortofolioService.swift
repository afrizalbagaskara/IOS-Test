//
//  PortofolioService.swift
//  portofolio
//
//  Created by Renotech ID on 17/10/23.
//

import Foundation

class PortofolioService{
    
    
    func getPortofolioUser(completion : @escaping (_ result: RequestResult<[Chart]>)->Void){
        let data: Data
        let filename : String = "portofolioData.json"
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            let result = try decoder.decode([Chart].self, from: data)
            completion(RequestResult.done(result))
        } catch {
            completion(RequestResult.failed(message: "Couldn't parse \(filename) as :\n\(error)"))
        }
        
    }
}
