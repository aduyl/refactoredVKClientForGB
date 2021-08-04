//
//  PhotoCell.swift
//  refactoredVKclient
//
//  Created by mac on 04.08.2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    static let identifier = "PhotoCell"
    var photo: UIImage?
    var photoView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(photo: UIImage){
        self.photo = photo
        photoView.image = photo
        photoView.backgroundColor = .white
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        photoView.image = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(photoView)
        photoView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}
