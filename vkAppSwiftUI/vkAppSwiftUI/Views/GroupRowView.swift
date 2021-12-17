//
//  GroupRowView.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import SwiftUI
import SwiftyJSON
import Kingfisher

struct GroupRowView: View {
    
    @ObservedObject var viewModel: GroupViewModel
    
    let networkService = NetworkService()
    
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        NavigationView {
            List(viewModel.groups, id: \.id) { group in
                HStack {
                    KFImage(group.avatarURL)
                        .cancelOnDisappear(true)
                    .resizable()
                    .iconStyle()
                    VStack(alignment: .leading) {
                        Text(group.name)
                            .textStyle()
                    }
            }
            }
        }
        .onAppear(perform: self.viewModel.getUserGroups)
        .navigationTitle("groups")
    }
    }


