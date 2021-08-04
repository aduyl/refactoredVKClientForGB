//
//  UniversalTableController.swift
//  refactoredVKclient
//
//  Created by mac on 20.07.2021.
//

import UIKit

class UniversalTableController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {
    let usersTableView = UITableView()
    var dataArray = [headerSection]()
    let configureWithNavigation: Bool
    // MARK: initialization
    init(configureWithNavigation: Bool){
        self.configureWithNavigation = configureWithNavigation
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(configure: configureWithNavigation)
        getDataArray()
    }
    // MARK: setup ui
    func getDataArray() {
        
    }
    func configureUI(configure: Bool) {
        if configure {
            configureNavigation()
            configureTableView()
        }else{
            configureSearchBar()
            configureTableView()
        }
    }
    func configureTableView(){
        self.view.backgroundColor = .white
        usersTableView.dataSource = self
        usersTableView.delegate = self
        view.addSubview(usersTableView)
        usersTableView.translatesAutoresizingMaskIntoConstraints = false
        usersTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(74)).isActive = true
        usersTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        usersTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        usersTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        usersTableView.register(UniversalTableViewCell.self, forCellReuseIdentifier: "groupCell")
    }
    func configureNavigation() {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 30, width: CGFloat(Double(self.view.frame.width) * 0.9), height: 44))
        view.addSubview(searchBar)
        let navButton = UIButton(frame: CGRect(x: CGFloat(Double(self.view.frame.width) * 0.9), y:30, width: CGFloat(Double(self.view.frame.width) * 0.1), height: 44))
        navButton.setImage(UIImage(systemName: "plus"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        view.addSubview(navButton)
    }
    func configureSearchBar() {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y:30, width: CGFloat(self.view.frame.width), height: 44))
        view.addSubview(searchBar)
    }
    @objc func pushNvigationButton(){
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! UniversalTableViewCell
        cell.group = dataArray[indexPath.section].tableCell[indexPath.row]
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

