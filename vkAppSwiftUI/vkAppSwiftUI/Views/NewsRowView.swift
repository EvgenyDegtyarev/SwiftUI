//
//  NewsRowView.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.news, id: \.id) { new in
                NavigationLink(destination: DetailNews(detailNew: new), label: {
                    HStack {
                    Image(new.newsImage)
                        .resizable()
                        .iconStyle()
                        VStack {
                            Text(new.newsTitle)
                            HStack {
                            Text(new.newsDate)
                            Label("\(new.newsViewCount)", systemImage: "eye.fill")
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        }
                    }
                })
               
            }
        }
        .navigationTitle("News")
}
    
}

