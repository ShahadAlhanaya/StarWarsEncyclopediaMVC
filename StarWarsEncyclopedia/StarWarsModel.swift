//
//  StarWarsModel.swift
//  StarWarsEncyclopedia
//
//  Created by Shahad Nasser on 20/12/2021.
//

import Foundation
class StarWarsModel{
    static var peopleNextUrl = "https://swapi.dev/api/people/?format=json"
    static func getAllPeople(completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        let url = URL(string: peopleNextUrl)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    static func getAllFilms(completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        let url = URL(string: "https://swapi.dev/api/films/?format=json")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
}
