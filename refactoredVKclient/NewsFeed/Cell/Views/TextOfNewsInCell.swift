//
//  TextOfNewsInCell.swift
//  refactoredVKclient
//
//  Created by mac on 16.09.2021.
//

import UIKit

class TextOfNewsInCell: UIView {
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In a sem sapien. Aenean sed nisi ac quam blandit rutrum quis eu enim. Etiam lectus sem, accumsan at augue vel, condimentum scelerisque est. Suspendisse sed quam velit. In pretium id tellus sit amet ultricies. Vivamus ac ornare arcu, ut ornare nulla. Suspendisse semper, magna eget euismod elementum, ligula libero posuere erat, non volutpat turpis enim ornare nisi. Phasellus sollicitudin quam sed ipsum efficitur rhoncus. Sed et augue id erat condimentum pellentesque. Suspendisse sagittis nulla elit, sit amet dapibus dui blandit sed. Proin pharetra viverra augue, interdum malesuada sem sollicitudin at."
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(systemName: "ellipsis.rectangle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .gray
        return button
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
        view.addSubview(textLabel)
        view.addSubview(moreButton)
        
        textLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        moreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        moreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        moreButton.addTarget(self, action: #selector(didPressMoreButton), for: .touchUpInside)
    }
    
    @objc private func didPressMoreButton(){
    
    }
    
}
