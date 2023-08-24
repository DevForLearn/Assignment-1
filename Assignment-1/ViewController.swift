//
//  ViewController.swift
//  Assignment-1
//
//  Created by SENGHORT KHEANG on 8/24/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cityNames: [String] = ["Cambodia", "France", "Cameroon", "Dominican Republic", "East Timor (Timor-Leste)", "Germany", "Iceland", "Jamaica", "Malaysia", "Marshall Islands", "Montenegro", "New Zealand", "Pakistan"]
    
    var countryNames: [String: String] = ["Cambodia": "Kingdom of Cambodia", "France": "French Republic", "Cameroon": "Republic of Cameroon", "Dominican Republic": "Dominican Republic", "East Timor (Timor-Leste)": "Democratic Republic of Timor-Leste", "Germany": "Federal Republic of Germany", "Iceland": "Republic of Iceland", "Jamaica": "Jamaica", "Malaysia": "Malaysia", "Marshall Islands": "Republic of the Marshall Islands", "Montenegro": "Republic of Montenegro", "New Zealand": "New Zealand", "Pakistan": "Islamic Republic of Pakistan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let name = cityNames[indexPath.row]
        
        var tableViewCellConguration = cell.defaultContentConfiguration()
        tableViewCellConguration.text = name
        tableViewCellConguration.secondaryText = countryNames[name] ?? ""
        cell.contentConfiguration = tableViewCellConguration
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city = cityNames[indexPath.row]
        print("City: \(city), Country: \(countryNames[city] ?? "")")
    }
}
