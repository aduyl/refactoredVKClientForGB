//
//  TestinfViewController.swift
//  refactoredVKclient
//
//  Created by mac on 04.08.2021.
//

import UIKit

class TestinfViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var array: [UIImage]
    let user: tableCellDataClass
    private var myCollectionView: UICollectionView?
    
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
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width , height: view.frame.height * 2 / 3)
        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = myCollectionView else {
            return
        }
        collectionView.register(FriendPhotosViewCell.self, forCellWithReuseIdentifier: FriendPhotosViewCell.identifier)
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        myCollectionView?.backgroundColor = .gray
        view.addSubview(myCollectionView!)
        myCollectionView?.frame = view.bounds
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return array.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendPhotosViewCell.identifier, for: indexPath) as! FriendPhotosViewCell
        cell.configure(user: user, index: indexPath.section)
        return cell
    }
}
