//
//  UserRowView.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import SwiftUI
import Kingfisher
import Alamofire

struct UserRowView: View {
    
    @ObservedObject var viewModel: UserViewModel
    @State private var isRotated = false
    
    let networkService = NetworkService()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.friends, id: \.id) { user in
                    HStack {
                        KFImage(user.userAvatarURL)
                        .resizable()
                        .iconStyle()
                        .rotationEffect(isRotated ? Angle(degrees: 360) : .zero)
                        .onTapGesture {
                            withAnimation{
                                self.isRotated.toggle()
                            }
                        }
                        Text("\(user.firstName) \(user.lastName)")
                            .textStyle()
                    }
                }
        }
        .onAppear(perform: self.viewModel.getUserFriends)
        .navigationBarHidden(false)
        .navigationTitle("friends")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarLeading){
                NavigationLink("groups") {
                    GroupRowView(viewModel: GroupViewModel(networkService: NetworkService()))
                }
                Spacer()
                NavigationLink("news") {
                    NewsView(viewModel: NewsViewModel())
                }
                Spacer()
                NavigationLink("images") {
                    OfflinePhotoRowView()
                }
                Spacer()
                NavigationLink("photos") {
                    FullPhotoView(viewModel: PhotosViewModel(networkService: NetworkService()))
                }
            }
        }
    }
}
