//
//  ViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Shahad Nasser on 19/12/2021.
//

import UIKit

class PeopleViewController: UITableViewController {
    
//    var people: [String] = Array()
    var people2 = [PeopleResult]()

    private var pendingWorkItem: DispatchWorkItem?
    let queue = DispatchQueue(label: "GetPeopleQueue")
    
    var nextPage = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
            fetch()
    }
    
    func fetch() {
           pendingWorkItem?.cancel()
           let newWorkItem = DispatchWorkItem {
                self.getPeople()
           }
           pendingWorkItem = newWorkItem
           queue.sync(execute: newWorkItem)
    }
    
    func getPeople(){
        StarWarsModel.getAllPeople(completionHandler: {data,response,error in
            guard let myData = data else { return }
            do{
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(People.self, from: myData)
                if let nextUrl = jsonResult.next {
                    StarWarsModel.peopleNextUrl = nextUrl
                }else{
                    self.nextPage = false
                }
                self.people2.append(contentsOf: jsonResult.results)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                if self.nextPage{
                    self.getPeople()
                }else{
                    return
                }
            }catch{
                print(error)
            }
            
        })
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people2.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = people2[indexPath.row].name
        return cell
    }


}

