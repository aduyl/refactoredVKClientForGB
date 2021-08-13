//
//  ShowAllPhotos.swift
//  refactoredVKclient
//
//  Created by mac on 05.08.2021.
//

import UIKit
import Kingfisher

class ShowAllPhotos: ViewController, UIScrollViewDelegate {
    let photoArray: [PostPhoto]?
    var photoView = UIView()
    var scrollView: UIScrollView!
    init(photoArray: [PostPhoto]) {
        self.photoArray = photoArray
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        photoView = UIView(frame: CGRect(x: 0, y: view.bounds.height * 0.1, width: view.bounds.width * CGFloat(photoArray!.count), height: view.bounds.height * 0.8))
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: photoView.frame.width, height: view.frame.height)
        self.scrollView.addSubview(photoView)
        view.addSubview(scrollView)
        if let arr = photoArray {
            cinfigureUI(array: arr)
        }
        configureNavigation()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    }
    func cinfigureUI(array: [PostPhoto]) {
        var count: Int = 0
        for item in array {
            let userPhoto: UIImageView = {
                let img = UIImageView()
                img.contentMode = .scaleAspectFit
                img.clipsToBounds = true
                return img
            }()
            let imgURL = URL(string: item.photo)
            userPhoto.kf.setImage(with: imgURL)
            userPhoto.frame = CGRect(x: view.bounds.width * CGFloat(count), y: 0 , width: view.bounds.width, height: photoView.bounds.height)
            self.photoView.addSubview(userPhoto)
            count += 1
        }
    }
    func configureNavigation() {
        let navButton = UIButton(frame: CGRect(x: 0, y:30, width: 44, height: 44))
        navButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        navButton.layer.cornerRadius = navButton.layer.frame.height / 2
        navButton.backgroundColor = UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 0.1)
        view.addSubview(navButton)
    }
    @objc func pushNvigationButton(){
        navigationController?.popViewController(animated: true)
    }
}
