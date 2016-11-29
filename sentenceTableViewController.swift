//
//  sentenceTableViewController.swift
//  MySentence
//
//  Created by Tom geri on 22/11/2016.
//  Copyright © 2016 Tom geri. All rights reserved.
//

import UIKit

class sentenceTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var sections: [SentenceNameSection] = []
    
    var filteredData: [SentenceNameSection] = []
    
    var shouldShowSearchResults = false
    
    var searchController: UISearchController!

    @IBOutlet weak var sentenceTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getSentenceInfo()
        
    }
    
    func getSentenceInfo() {
        sections = [SentenceNameSection]()
        sections = SectionInfo().getSectionFromData()
        sentenceTableView.reloadData()
    }
    
    // MARK: Search bar
    
    func configureSearchController() {
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        sentenceTableView.tableHeaderView = searchController.searchBar
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        sentenceTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        sentenceTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            sentenceTableView.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchString = searchController.searchBar.text
        
        filteredData.removeAll()
        for section in sections {
            let filteredContent = section.crimes.filter { $0.name.range(of: searchString!) != nil }
            if !filteredContent.isEmpty {
                filteredData.append(SentenceNameSection(title: section.firstLetter, objects: filteredContent))
            }
        }
        sentenceTableView.reloadData()
    }
    

    // MARK: - Table view data source
    
    private let cellIdentifer = "Cell"

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if shouldShowSearchResults {
            return filteredData.count
        } else {
            return sections.count
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if shouldShowSearchResults {
            return filteredData[section].crimes.count
        } else {
            return sections[section].crimes.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if shouldShowSearchResults {
            return filteredData[section].firstLetter
        } else {
            return sections[section].firstLetter
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: sentenceTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as! sentenceTableViewCell
        
        if shouldShowSearchResults {
            
            let filteredCrime: SentenceInfo = filteredData[indexPath.section].crimes[indexPath.row]
            
            cell.nameLabel.text = filteredCrime.name
            cell.detailLabel.text = filteredCrime.detail
            cell.sentenceLabel.text = filteredCrime.sentence
            cell.selectionStyle = .none
            
        } else {
            
            let crime: SentenceInfo = sections[indexPath.section].crimes[indexPath.row]
            
            cell.nameLabel.text = crime.name
            cell.detailLabel.text = crime.detail
            cell.sentenceLabel.text = crime.sentence
            cell.selectionStyle = .none
            
        }
        return cell
    }
}
