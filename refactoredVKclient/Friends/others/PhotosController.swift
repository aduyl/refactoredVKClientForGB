//
//  PhotosController.swift
//  refactoredVKclient
//
//  Created by mac on 04.08.2021.
//

import UIKit


class PhotosController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let array: [UIImage]
    var collectionView: UICollectionView?
    init(array: [UIImage]){
        self.array = array
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 30, left: 10, bottom: 40, right: 10)
        layout.itemSize = CGSize(width: view.frame.width * 0.9 , height: view.frame.height * 0.6)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        let navButton = UIButton(frame: CGRect(x: 0, y:30, width: 44, height: 44))
        navButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        navButton.layer.cornerRadius = navButton.layer.frame.height / 2
        navButton.backgroundColor = UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 0.1)
        view.addSubview(navButton)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        cell.configure(photo: array[indexPath.row])
        return cell
    }
    @objc func pushNvigationButton(){
        navigationController?.popViewController(animated: true)
    }
}
