//
//  DetailsFilmsViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Shahad Nasser on 21/12/2021.
//

import UIKit

class DetailsFilmsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    var filmTitle: String?
    var releaseDate: String?
    var director: String?
    var openingCrawl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = filmTitle
        releaseDateLabel.text = "Release: \(releaseDate ?? " ")"
        directorLabel.text = "Director: \(director ?? " ")"
        openingCrawlLabel.text = "Opening Crawl: \(openingCrawl ?? " ")"
    }
}
