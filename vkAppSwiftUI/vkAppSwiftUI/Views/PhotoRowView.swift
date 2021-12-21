//
//  PhotoRowView.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import SwiftUI
import Kingfisher

struct FullPhotoView: View {

    
    @ObservedObject var viewModel: PhotosViewModel
    
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
    ]
    
    let networkService = NetworkService()

//    init(viewModel: PhotosViewModel) {
//        self.viewModel = viewModel
//    }

    var body: some View {
        List(viewModel.photos, id: \.id) { photos in
            KFImage(photos.sizes.first {$0.type == "1"}?.url)
                .cancelOnDisappear(true)
        }
        .onAppear(perform: self.viewModel.getUserPhotos)
    }
}


