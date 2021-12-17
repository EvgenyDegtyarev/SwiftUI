//
//  DetailNewsRowView.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import SwiftUI

struct DetailNews: View {
    
    var detailNew: NewsModel
    
    @State var isRotated = false
    @State var scale: CGFloat = 1.0
    @State private var showDetails = false
    
    var body: some View {
            VStack {
                Image(detailNew.newsImage)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaleEffect(scale)
                    .onAppear {
                            let baseAnimation = Animation.easeInOut(duration: 1)
                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                                   withAnimation(repeated) {
                                       scale = 0.7
                                   }
                               }
                Button("\(detailNew.newsTitle)")  {
                    withAnimation {
                        showDetails.toggle()
                        }
                    }
                if showDetails {
                    Text("\(detailNew.newsDescription)")
                        .transition(.moveAndScale)
                }
                HStack{
                    Label("\(detailNew.newsViewCount)",systemImage: "eye.fill")
                    Text(detailNew.newsDate)
                }
                .padding()
                .foregroundColor(.secondary)
            }
            .padding()
    }
}

extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}
