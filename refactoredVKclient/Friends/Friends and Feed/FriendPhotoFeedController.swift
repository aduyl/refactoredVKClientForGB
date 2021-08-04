//
//  TestinfViewController.swift
//  refactoredVKclient
//
//  Created by mac on 04.08.2021.
//

import UIKit

class FriendPhotoFeedController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
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
        myCollectionView?.backgroundColor = .white
        view.addSubview(myCollectionView!)
        myCollectionView?.frame = view.bounds
        let navButton = UIButton(frame: CGRect(x: 0, y:30, width: 44, height: 44))
        navButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        navButton.layer.cornerRadius = navButton.layer.frame.height / 2
        navButton.backgroundColor = UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 0.1)
        view.addSubview(navButton)
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return array.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendPhotosViewCell.identifier, for: indexPath) as! FriendPhotosViewCell
        cell.configure(user: user, index: indexPath.section + 1)
        let recognaizer = UITapGestureRecognizer(target: self, action: #selector(imageHasBeenTapped))
        cell.userPhoto.addGestureRecognizer(recognaizer)
        return cell
    }
    @objc func pushNvigationButton(){
        navigationController?.popViewController(animated: true)
    }
    @objc func imageHasBeenTapped(){
        let newContr = PhotosController(array: array)
        navigationController?.pushViewController(newContr, animated: true)
    }
}
