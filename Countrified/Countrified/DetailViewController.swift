//
//  DetailViewController.swift
//  Countrified
//
//  Created by Daniel Senga on 2022/05/04.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var populationLbl: UILabel!
    @IBOutlet var regionLbl: UILabel!
    @IBOutlet var independentLbl: UILabel!
    @IBOutlet var fifaStatusLbl: UILabel!
    
    
    var population: Int = 0
    var subregion: String?
    var independent: Bool?
    var fifa: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabels()
       
        // Do any additional setup after loading the view.
    }
    
    func loadLabels() {
        populationLbl.text = "Population is \(population) people 👥"
        regionLbl.text = "It is located in \(subregion ?? "World") 🗺"
        
        guard let fifa = fifa else {
            return
        }

        fifaStatusLbl.text = "Fifa Initials: \(fifa) ⚽️"
        
        guard let independent = independent else {
            return
        }
        
        if independent {
            independentLbl.text = "This country is independent 🎊"
        } else {
            independentLbl.text = "This country is not independent 🚫"
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
