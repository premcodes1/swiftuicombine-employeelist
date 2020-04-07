//
//  EmployeeViewModel.swift
//  EmployeeList
//
//  Created by Prem Nalluri on 25/03/20.
//  Copyright © 2020 AgathsyaTechnologies. All rights reserved.
//

import Foundation
import Combine

class EmployeeViewModel : ObservableObject{
    @Published var pulbishingNames : [String] = []
    @Published var employeeData : [EmployeeDatum] = []
    func receivedEmployeeData(){
        WebService.fetchApi()
            .sink(receiveCompletion: {completion in
                switch completion{
                case.finished:
                    print("finished")
                case.failure(let error):
                    print(error)
                }
            }, receiveValue: {value in
                self.employeeData = value
                for i in self.employeeData{
                    self.pulbishingNames = self.pulbishingNames + [i.employeeName!]
                }
            })
    }
}
