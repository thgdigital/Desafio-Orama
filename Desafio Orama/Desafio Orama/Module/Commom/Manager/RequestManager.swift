//
//  RequestManager.swift
//  Desafio Orama
//
//  Created by THIAGO on 03/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Alamofire

class RequestManager: NSObject {
    
    let baseURL = "https://s3.amazonaws.com/orama-media/json/fund_detail_full.json"
    
    func request(with completion: @escaping ((_ funds: FundModel?, _ error: Error?) -> Void)) {
        Alamofire.request(baseURL).validate().responseJSON { response in
            switch response.result {
            case .success:
                
                guard let data = response.data, let listModel = self.getList(jsonData: data) else {
                    completion(nil, nil)
                    return
                }
                completion(listModel, nil)
                
            case .failure(let error):
                completion(nil, error)
                
            }
        }
    }
    
    func getList(jsonData: Data) -> FundModel? {
        do {
            let decoder = JSONDecoder()
            let items = try decoder.decode(FundModel.self, from: jsonData)
            return items
        } catch {
            return nil
        }
    }
}
