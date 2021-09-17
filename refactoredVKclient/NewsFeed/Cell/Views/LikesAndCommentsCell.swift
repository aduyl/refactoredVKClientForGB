//
//  LikesAndCommentsCell.swift
//  refactoredVKclient
//
//  Created by mac on 16.09.2021.
//

import UIKit

class LikesAndCommentsCell: UIView {
    
    private var isLiked = true
    var likeCount = 0
    var commentCount = 0
    var repostCount = 0
    
    lazy var likeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(systemName: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(red: 255/255, green: 102/255, blue: 133/255, alpha: 1)
        return button
    }()
    
    lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    lazy var repostButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(systemName: "arrowshape.turn.up.forward"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .link
        return button
    }()
    
    lazy var repostLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    lazy var commentButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(systemName: "bubble.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .link
        return button
    }()
    
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(frame: CGRect) {
        view.frame = frame
        let likeView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width / 6, height: frame.height))
        let repostView = UIView(frame: CGRect(x: frame.width / 6, y: 0, width: frame.width / 6, height: frame.height))
        let commentView = UIView(frame: CGRect(x: frame.width / 3, y: 0, width: frame.width / 6, height: frame.height))
        
        view.addSubview(likeView)
        view.addSubview(repostView)
        view.addSubview(commentView)
        
        likeView.addSubview(likeButton)
        likeView.addSubview(likeLabel)
        repostView.addSubview(repostButton)
        repostView.addSubview(repostLabel)
        commentView.addSubview(commentButton)
        commentView.addSubview(commentLabel)
        
        
        likeLabel.text = "\(likeCount)"
        commentLabel.text = "\(commentCount)"
        repostLabel.text = "\(repostCount)"
        
        likeButton.topAnchor.constraint(equalTo: likeView.topAnchor, constant: 5).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: likeView.leadingAnchor).isActive = true
        likeButton.widthAnchor.constraint(equalTo: likeView.heightAnchor, multiplier: 0.6).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: likeView.bottomAnchor, constant: -5).isActive = true
        
        likeLabel.topAnchor.constraint(equalTo: likeView.topAnchor, constant: 5).isActive = true
        likeLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 5).isActive = true
        likeLabel.trailingAnchor.constraint(equalTo: likeView.trailingAnchor, constant: -5).isActive = true
        likeLabel.bottomAnchor.constraint(equalTo: likeView.bottomAnchor, constant: -5).isActive = true
        
        repostButton.topAnchor.constraint(equalTo: repostView.topAnchor, constant: 5).isActive = true
        repostButton.leadingAnchor.constraint(equalTo: repostView.leadingAnchor).isActive = true
        repostButton.widthAnchor.constraint(equalTo: repostView.heightAnchor, multiplier: 0.6).isActive = true
        repostButton.bottomAnchor.constraint(equalTo: repostView.bottomAnchor, constant: -5).isActive = true
        
        repostLabel.topAnchor.constraint(equalTo: repostView.topAnchor, constant: 5).isActive = true
        repostLabel.leadingAnchor.constraint(equalTo: repostButton.trailingAnchor, constant: 5).isActive = true
        repostLabel.trailingAnchor.constraint(equalTo: repostView.trailingAnchor, constant: -5).isActive = true
        repostLabel.bottomAnchor.constraint(equalTo: repostView.bottomAnchor, constant: -5).isActive = true
        
        commentButton.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 5).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: commentView.leadingAnchor).isActive = true
        commentButton.widthAnchor.constraint(equalTo: commentView.heightAnchor, multiplier: 0.6).isActive = true
        commentButton.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -5).isActive = true
        
        commentLabel.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 5).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 5).isActive = true
        commentLabel.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -5).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -5).isActive = true
        
        likeButton.addTarget(self, action: #selector(didPressLikeButton), for: .touchUpInside)

    }
    
    @objc private func didPressLikeButton(){
        if isLiked{
            self.likeButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            self.likeCount = likeCount + 1
        } else {
            self.likeButton.setImage(UIImage.init(systemName: "heart"), for: .normal)
            self.likeCount = likeCount - 1
        }
        UIView.transition(with: self.likeLabel,
                          duration: 0.3,
                          options: .transitionCrossDissolve, animations:{
                            self.likeLabel.text = "\(self.likeCount)"
                          })
        self.isLiked = !self.isLiked
    }
    
}
