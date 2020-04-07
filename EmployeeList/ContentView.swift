//
//  ContentView.swift
//  EmployeeList
//
//  Created by Prem Nalluri on 25/03/20.
//  Copyright © 2020 AgathsyaTechnologies. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var employeeViewModel = EmployeeViewModel()
    var body: some View {
        Form{
            Section{
                Button(action: {self.employeeViewModel.receivedEmployeeData()}){
                    Text("get empoloyee names")
                }
            }
            Section{
                List(employeeViewModel.pulbishingNames , id:\.self){ publishedName in
                    Text("\(publishedName)")
                    
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
