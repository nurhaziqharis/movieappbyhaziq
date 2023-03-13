//
//  MovieDetailView.swift
//  MovieAppByHaziqApp
//
//  Created by Haziq Haris on 12/3/2023.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var model = MovieDetailsViewModel()
    @State var customLineLimit = 2
    @State var textToggle = false
    @State var isMore = false
    
    let movie: Movie
    let headerHeight: CGFloat = 400
    
    var body: some View {
        ZStack {
            VStack{
                GeometryReader { geo in
                    VStack {
                        AsyncImage(url: movie.backdropURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: geo.size.width, maxHeight: headerHeight)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        } placeholder: {
                            ProgressView()
                        }
                    
                    }
                }
                ScrollView {
                    VStack(spacing: 12) {
                        HStack {
                            Text(movie.title)
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Cast & Crew")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(model.castProfiles) { cast in
                                    CastView(cast: cast)
                                }
                            }
                        }
                        HStack {
                            Text("About film")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Button(action: {
                                isMore.toggle()
                                if isMore == false {
                                    customLineLimit = 2
                                }else{
                                    customLineLimit = 4
                                }
                            }, label: {
                                
                                if isMore == false{
                                    Text("See more").padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                        .foregroundColor(.blue)
                                }else{
                                    Text("See less").padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                        .foregroundColor(.blue)
                                }
                            })
                            Spacer()
                        }
                        
                        Text(movie.overview)
                            .lineLimit(customLineLimit)
                            .foregroundColor(.black)
                    }
                    .padding()
                }
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .fontWeight(.bold)
            }
            .padding(.leading)
        }
        .toolbar(.hidden, for: .navigationBar)
        .task {
            await model.movieCredits(for: movie.id)
            await model.loadCastProfiles()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}

