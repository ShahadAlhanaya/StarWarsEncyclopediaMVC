//
//  DetailsPeopleViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Shahad Nasser on 20/12/2021.
//

import UIKit

class DetailsPeopleViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var birthyearLabel: UILabel!
    
    var name: String?
    var gender: String?
    var mass: String?
    var birthyear: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        genderLabel.text = "Gender: \(gender ?? " ")"
        massLabel.text = "Mass: \(mass ?? " " )"
        birthyearLabel.text = "Birth Year: \(birthyear ?? " " )"
    }

}
