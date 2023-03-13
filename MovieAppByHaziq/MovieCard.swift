//
//  MovieCard.swift
//  MovieAppByHaziqApp
//
//  Created by Haziq Haris on 12/3/2023.
//

import Foundation
import SwiftUI

struct MovieCard: View {

    let movieItem: Movie

    var body: some View {
        ZStack(alignment: .bottom) {
            ////////////////////////////////////////////////////////////////////////

            AsyncImage(url: movieItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 240, height: 420)
            } placeholder: {
                Rectangle().fill(Color(red:61/255,green:61/255,blue:88/255))
                        .frame(width: 340, height: 400)
                        .fixedSize()
            }
            ////////////////////////////////////////////////////////////////////////
        
            VStack {
                HStack {
                    Text(movieItem.title)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", movieItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(.white))
        }
        .cornerRadius(10)
    }
}










/*
 //
 //  MovieCard.swift
 //  MovieAppByHaziqApp
 //
 //  Created by Haziq Haris on 12/3/2023.
 //

 import Foundation
 import SwiftUI

 struct MovieCard: View {

     let movieItem: Movie

     var body: some View {
         ZStack(alignment: .bottom) {
             ////////////////////////////////////////////////////////////////////////

             AsyncImage(url: movieItem.backdropURL) { image in
                 image
                     .resizable()
                     .scaledToFill()
                     .frame(width: 240, height: 420)
             } placeholder: {
                 Rectangle().fill(Color(red:61/255,green:61/255,blue:88/255))
                         .frame(width: 340, height: 400)
                         .fixedSize()
             }
             ////////////////////////////////////////////////////////////////////////
         
             VStack {
                 HStack {
                     Text(movieItem.title)
                         .foregroundColor(.black)
                         .fontWeight(.heavy)
                         .lineLimit(1)
                         .multilineTextAlignment(.leading)
                     Spacer()
                     Image(systemName: "heart.fill")
                         .foregroundColor(.red)
                 }
                 HStack {
                     Image(systemName: "hand.thumbsup.fill")
                     Text(String(format: "%.1f", movieItem.vote_average))
                     Spacer()
                 }
                 .foregroundColor(.yellow)
                 .fontWeight(.heavy)
             }
             .padding()
             .background(Color(.white))
         }
         .cornerRadius(10)
     }
 }


 */
