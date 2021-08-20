//
//  TestinfViewController.swift
//  refactoredVKclient
//
//  Created by mac on 04.08.2021.
//

import UIKit

final class FriendPhotoFeedController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var postPhotos = [PostPhoto]()
    var user: User
    var network = NetworkLayer()
    private var myCollectionView: UICollectionView?
    
    // MARK: - initialization
    init(user: User){
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getData()
    }
    
    // MARK: - json parsing
    func getData() {
        network.downloadPhotos(ownerId: user.id, token: Session.instance.token) {
            [weak self] result in
            guard let self = self else { return }
                        switch result {
                        case .failure(let error) :
                            self.showAlert(alertText: "\(error)")
                        case .success(let data) :
                            self.postPhotos = data
                            self.myCollectionView?.reloadData()
                        }
        }
    }

    // MARK: - Configure UI
    private func configure() {
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
    
    // MARK: - Error alert
    func showAlert(alertText: String) {
        let alertController = UIAlertController(title: "Error", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Configure CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return postPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendPhotosViewCell.identifier, for: indexPath) as! FriendPhotosViewCell
        cell.configure(userName: "\(user.firstName) \(user.lastName)", avatar: user.photo100, photo: postPhotos[indexPath.section])
        let recognaizer = UITapGestureRecognizer(target: self, action: #selector(imageHasBeenTapped))
        cell.userPhoto.addGestureRecognizer(recognaizer)
        return cell
    }
    
    //MARK: - Processing buttons clicks
    @objc private func pushNvigationButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func imageHasBeenTapped(){
        let newContr = ShowAllPhotos(photo: postPhotos)
        navigationController?.pushViewController(newContr, animated: true)
    }
}
