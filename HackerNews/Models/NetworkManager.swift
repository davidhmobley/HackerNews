//
//  NetworkManager.swift
//  HackerNews
//
//  Created by David Mobley on 11/5/20.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Hit]()
    
    func fetchData() {
        // see: https://hn.algolia.com/api
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if (error != nil) {
                    print("fetchData: ERROR: \(error!.localizedDescription)")
                    //delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    do {
                        let hackerNewsResults = try JSONDecoder().decode(HackerNewsModel.self, from: safeData)
                        
                        DispatchQueue.main.async {
                            self.posts = hackerNewsResults.hits
                        }
                    } catch {
                        print("fetchData: ERROR: \(error.localizedDescription)")
                    }
                } else {
                    print("ERROR: no data to parse")
                }
            }
            task.resume()
        } else {
            print("ERROR: url is empty")
        }
    }
        
}
