//
//  FilmsTableViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Shahad Nasser on 19/12/2021.
//

import UIKit

class FilmsTableViewController: UITableViewController {
    
    var films: Films?

    private var pendingWorkItem: DispatchWorkItem?
    let queue = DispatchQueue(label: "GetFilmsQueue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    
    }
    
    func fetch(){
        pendingWorkItem?.cancel()
        let newWorkItem = DispatchWorkItem {
             self.getFilms()
        }
        pendingWorkItem = newWorkItem
        queue.sync(execute: newWorkItem)
    }
    
    func getFilms(){
        StarWarsModel.getAllFilms(completionHandler: {data,response,error in
            guard let myData = data else { return }
            do{
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(Films.self, from: myData)
                self.films = jsonResult
//                print(jsonResult)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error)
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films?.count ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = films?.results[indexPath.row].title
        return cell
    }

}
