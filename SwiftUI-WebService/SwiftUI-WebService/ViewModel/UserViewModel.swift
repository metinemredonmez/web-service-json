//
//  UserViewModel.swift
//  SwiftUI-WebService
//
//  Created by Metin Donmez on 21.08.2022.
//

import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    //let webservice = Webservice()
    private var service : NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async {
        
        var resource = ""
        
        if service.type == "Webservice" {
            resource = Contants.Urls.usersExtension
        } else {
            resource = Contants.Paths.baseUrl
        }
        
        do {
            let users = try await service.download(resource)

            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }

        } catch {
            print(error)
        }
        
    }
    
    
}



struct UserViewModel {
    
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email: String {
        user.email
    }
    
}
    
    
//    // adrress
//
//    let Address :Address
//
//    var city : String {
//        Address.city
//
//    }
//
//    var street : String {
//        Address.street
//
//    }
    
    













