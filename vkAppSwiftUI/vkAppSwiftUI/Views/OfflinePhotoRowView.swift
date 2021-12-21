//
//  OfflinePhotoRowView.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 21.12.2021.
//

import SwiftUI

struct OfflinePhotoRowView: View {

    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
    ]
    
    var body: some View {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 2) {
                    ForEach(offlinePhotos, id: \.self) { photo in
                        Image(photo)
                            .resizable()
                            .scaledToFit()
                            .clipped()
                    }
                }
            }
            .navigationBarTitle("photos")
            .navigationBarHidden(false)
    }
}


struct OfflinePhotoRowView_Previews: PreviewProvider {
    static var previews: some View {
        OfflinePhotoRowView()
    }
}
