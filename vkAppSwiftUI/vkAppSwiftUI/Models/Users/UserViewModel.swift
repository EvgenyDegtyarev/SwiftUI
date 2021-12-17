//
//  UserViewModel.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    private let networkService: NetworkService
    @Published private(set) var friends: [VKFriends] = []
    
    init(networkService: NetworkService) {
            self.networkService = networkService
        }
    
    func getUserFriends() {
        self.networkService.getUserFriends{ [weak self] vkFriends in
            guard
                let self = self,
                let friends = vkFriends
            else {return}
                self.friends = friends}
                    }
    }
