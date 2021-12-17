//
//  PhtotoViewModel.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import Foundation
import Combine

class PhotosViewModel: ObservableObject {
    
    private let networkService: NetworkService
    @Published private(set) var photos: [VKPhoto] = []
    
    init(networkService: NetworkService) {
            self.networkService = networkService
        }
    
    func getUserPhotos() {
        self.networkService.getUserPhotos(userID: Session.instance.userId!){ [weak self] vkPhotos in
            guard
                let self = self,
                let photos = vkPhotos
            else {return}
                self.photos = photos}
                    }
    }
