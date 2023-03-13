//
//  Homepage.swift
//  MovieAppByHaziqApp
//
//  Created by Haziq Haris on 12/3/2023.
//

import SwiftUI

struct HomePage: View {
    
    @StateObject var viewModel = MovieDiscoverViewModel()
    @State var scaleEffect = 0.75
    var screenWidthCheck: CGFloat {
        
        //take width of the screen
        let screen = UIScreen.main.bounds
        return CGFloat(screen.size.width)
        
    }
    var screenWidth: CGFloat{
        
        //change scale effect depend on size and store to $scaleEffect
        switch screenWidthCheck {
        case 375:
            scaleEffect = 0.76 //iphone SE
        case 393:
            scaleEffect = 0.8 //iphone 14 pro
        case 414:
            scaleEffect = 0.85 //iphone 11
        case 430:
            scaleEffect = 0.88 //iphone 14 pro max
        default:
            scaleEffect = 0.75
        }
        return scaleEffect
        
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader{ geometry in
                ScrollView{
                    Text("Movie App")
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: -10, trailing: 0))
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 180), spacing: 0)],spacing: 0) {
                        ForEach(viewModel.movieList.shuffled()) { movieItem in
                            NavigationLink {
                                MovieDetailView(movie: movieItem)
                            } label: {
                                MovieCard(movieItem: movieItem)
                                    .scaleEffect(screenWidth)
                            }
                        }
                    }
                }.background(Color(red: 200/225, green: 200/225, blue: 200/225).ignoresSafeArea())
            }
        }.refreshable {}
            .onAppear {
                viewModel.loadMovie()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomePage()
    }
}


