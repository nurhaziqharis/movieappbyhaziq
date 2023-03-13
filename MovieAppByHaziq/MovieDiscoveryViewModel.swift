//
//  MovieDiscoverViewModel.swift
//  MovieAppByHaziqApp
//
//  Created by Haziq Haris on 12/3/2023.
//

import Foundation

@MainActor
class MovieDiscoverViewModel: ObservableObject {

    @Published var movieList: [Movie] = []

    static let apiKey = "ab8ca7862f2733af2356c592de5f9d45"

    func loadMovie() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDiscoverViewModel.apiKey)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let movieResults = try JSONDecoder().decode(MovieResult.self, from: data)
                movieList = movieResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
