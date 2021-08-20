//
//  FriendsController.swift
//  refactoredVKclient
//
//  Created by mac on 12.07.2021.
//

import UIKit
import Foundation

final class FriendsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate {
    
    let tableView = UITableView()
    var data = [UsersHeaderSection]()
    var searchBar = UISearchBar()
    var network = NetworkLayer()
    // MARK: initialization
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureTableView()
        searchBar.delegate = self
        getData()
    }
    
    // MARK: - json parsing
    func getData() {
        network.downloadUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error) :
                self.showAlert(alertText: "\(error)")
            case .success(let data) :
                self.data = sortByName(users: data)
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: setup ui
    private func configureTableView(){
        self.view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 74, width: view.bounds.width, height: view.bounds.height - 74)
        tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "userCell")
    }
    
    private func configureSearchBar() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y:30, width: CGFloat(self.view.frame.width), height: 44))
        view.addSubview(searchBar)
    }
    
    // MARK: - Error alert
    func showAlert(alertText: String) {
        let alertController = UIAlertController(title: "Error", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: TODO
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String)
    {
    }

    //MARK: configure tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.data[section]
        return section.tableCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! FriendsTableViewCell
        cell.configure(friend: data[indexPath.section].tableCell[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return "\(data[section].letter)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        let user = data[indexPath.section].tableCell[indexPath.row]
        let friendPhotoFeed = FriendPhotoFeedController(user: user)
        navigationController?.pushViewController(friendPhotoFeed, animated: true)
        return indexPath
    }
}

