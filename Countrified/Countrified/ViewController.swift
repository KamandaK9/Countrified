//
//  ViewController.swift
//  Countrified
//
//  Created by Daniel Senga on 2022/05/01.
//

import UIKit

class ViewController: UITableViewController {
    var country = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Countrified"
        loadCountries()
        
    }
    
    //MARK: Parsing
    func loadCountries() {
        let urlString: String
        
        urlString = "https://restcountries.com/v3.1/all"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        do {
            let jsonCountries = try decoder.decode([Country].self, from: json).sorted()
            country = jsonCountries
            tableView.reloadData()
            
        } catch let error {
            print(error)
        }
    }


    //MARK: TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryName", for: indexPath)
        let countries = country[indexPath.row]
        let flag = countries.flag ?? ""
        cell.textLabel?.text = "\(countries.name.common)  \(flag)"
        cell.detailTextLabel?.text = " Official Name: \(countries.name.official)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countries = country[indexPath.row]
        let flag = countries.flag ?? ""
        let population = countries.population
        let subregion = countries.subregion
        guard let independent = countries.independent else { return }
        guard let fifastatus = countries.fifa else { return }

        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.population = population
            vc.subregion = subregion ?? "World"
            vc.independent = independent
            vc.fifa = fifastatus
            vc.title = "\(countries.name.official) \(flag)"
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    


}

