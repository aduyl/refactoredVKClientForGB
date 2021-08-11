//
//  FriendsController.swift
//  refactoredVKclient
//
//  Created by mac on 12.07.2021.
//

import UIKit
import Foundation

class FriendsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate {
    let usersTableView = UITableView()
    var dataArray: [UsersHeaderSection]
    var searchBar = UISearchBar()
    // MARK: initialization
    
    init(){
        self.dataArray = []
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureTableView()
        getDataArray()
        searchBar.delegate = self
        
    }
    
    // MARK: setup ui
    func getDataArray() { }
    
    func configureTableView(){
        self.view.backgroundColor = .white
        usersTableView.dataSource = self
        usersTableView.delegate = self
        view.addSubview(usersTableView)
        usersTableView.frame = CGRect(x: 0, y: 74, width: view.bounds.width, height: view.bounds.height - 74)
        usersTableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "userCell")
    }
    
    func configureSearchBar() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y:30, width: CGFloat(self.view.frame.width), height: 44))
        view.addSubview(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String)
    {
    }

    //MARK: uitableview functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.dataArray[section]
        return section.tableCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! FriendsTableViewCell
        cell.friend = dataArray[indexPath.section].tableCell[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return "\(dataArray[section].letter)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        return indexPath
    }
    
}

