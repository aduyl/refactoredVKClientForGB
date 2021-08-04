//
//  FriendPageController.swift
//  refactoredVKclient
//
//  Created by mac on 29.07.2021.
//

import UIKit
import Foundation

class FriendPageController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    var userPageCollection: UICollectionView?
    let user: tableCellDataClass
    let userCell = "userCell"
    var array: [UIImage]
    
//    public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(frame: frame, collectionViewLayout: layout)
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.8875, height: 90*3)
//        frame = UIScreen.main.bounds
//        collectionViewLayout = layout
//    }
    
    init(user: tableCellDataClass){
        self.user = user
        self.array = user.usersPhotos!
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .white
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.width)
        userPageCollection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.userPageCollection!.register(FriendPhotosViewCell.self, forCellWithReuseIdentifier: userCell)
        userPageCollection!.dataSource = self
        userPageCollection!.delegate = self
        userPageCollection!.backgroundColor = .gray
        view.addSubview(userPageCollection!)
        self.view = view
        configureSearchBar()
        configureCollectionView()
        
    }
    
    func configureSearchBar() {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 20, width: CGFloat(Int(self.view.frame.width)), height: 44))
        view.addSubview(searchBar)
    }
    func configureCollectionView(){
        self.view.backgroundColor = .white
        userPageCollection!.translatesAutoresizingMaskIntoConstraints = false
        userPageCollection!.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(64)).isActive = true
        userPageCollection!.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        userPageCollection!.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        userPageCollection!.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.user.usersPhotos!.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.user.usersPhotos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userCell, for: indexPath) as! FriendPhotosViewCell
        cell.user = user
        cell.index = indexPath.section
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
//    }

}


