//
//  Person.swift
//  StarWarsEncyclopedia
//
//  Created by Shahad Nasser on 20/12/2021.
//

import Foundation
struct People: Codable {
    let count: Int
    let next: String?
    let previous: String?
    var results: [PeopleResult]

    private enum CodingKeys: String, CodingKey {
           case count, next, previous, results
    }
}

struct PeopleResult: Codable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let gender: String
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
    }
}

//enum Gender: String, Codable {
//    case female = "female"
//    case male = "male"
//    case nA = "n/a"
//}
    
/*
 enum CodingKeys: String, CodingKey {
    case title
    case episodeID = "episode_id"
    case openingCrawl = "opening_crawl"
    case director, producer
    case releaseDate = "release_date"
 case characters, planets, starships, vehicles, species, created, edited, url
}
 
 enum CodingKeys: String, CodingKey {
         case id, title, url
         case imageURL = "imageUrl"
         case newsSite, summary, publishedAt, updatedAt, featured, launches, events
     }

 */
    /*
    do {
                    guard let mydata = data else {return}
                    let postResult = try JSONDecoder().decode(Films.self ,from: mydata)
                    
                     self.film = postResult
                    
                    DispatchQueue.main.async
                    
                    {

                    self.tableView.reloadData()
                        
                    }
                } catch {
                    print(error)
                }
    */
    
    /*
     let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles")
             
             
             let session = URLSession.shared
             
             
             let task = session.dataTask(with: url!, completionHandler: {
                 // see: Swift closure expression syntax
                 data, response, error in
                 print("in here")
                 
                 // see: Swift nil coalescing operator (double questionmark)
                 print(data ?? "no data") // the "no data" is a default value to use if data is nil
                 
                 guard let myData = data else { return }
     do {
     //                if let jsonResult = try JSONSerialization.jsonObject(with: myData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
     //                    print(jsonResult)
     //
     //                    for result in jsonResult {
     //                        let object = result as! NSDictionary
     //                        guard let title = object["title"] as? String else { return }
     //                        self.spaceFlight?.append(title)
     //                    }
     //
     //                }
                     let decoder = JSONDecoder()
                     let jsonResult = try decoder.decode([SpaceTitle].self, from: myData)
                     self.spaceFlight = jsonResult
                     DispatchQueue.main.async {
                         self.tableView.reloadData()
                     }
     */
    
    
