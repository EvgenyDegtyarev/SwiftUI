//
//  GroupViewModel.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import Foundation
import Combine
//import SwiftyJSON

class GroupViewModel: ObservableObject {
    
    private let networkService: NetworkService
    
    @Published private(set) var groups: [VKGroup] = []
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getUserGroups() {
        self.networkService.getUserGroups{ [weak self] vkGroups in
            guard
                let self = self,
                let groups = vkGroups
            else {return}
            self.groups = groups}
    }
    
}



