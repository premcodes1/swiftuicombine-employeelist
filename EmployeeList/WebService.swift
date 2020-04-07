//
//  WebService.swift
//  EmployeeList
//
//  Created by Prem Nalluri on 25/03/20.
//  Copyright © 2020 AgathsyaTechnologies. All rights reserved.
//

import Foundation
import Combine
class WebService{
    enum ApiError : Error , LocalizedError{
        case unknown, apiError(reson : String)
    }
    static func fetchApi()-> AnyPublisher<[EmployeeDatum],Error>{
        let url = "http://dummy.restapiexample.com/api/v1/employees"
        guard let Url = URL(string: url)else{
            fatalError("invalid url")
        }
        return URLSession.shared.dataTaskPublisher(for: Url)
            .tryMap{ data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else{
                        throw ApiError.apiError(reson: "something went wrong")
                }
                return data
                
        }
        .decode(type: EmployeeRoot.self, decoder: JSONDecoder())
        .map{
            $0.data!
        }
        .receive(on: RunLoop.main)
    .eraseToAnyPublisher()
    }
}
