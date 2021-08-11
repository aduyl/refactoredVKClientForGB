//
//  FriendsTableViewCell.swift
//  refactoredVKclient
//
//  Created by mac on 10.08.2021.
//

import Foundation
import UIKit

class FriendsTableViewCell: UniversalTableViewCell {
    var friend: Users?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if let frien = friend {
            configure(friend: frien)
        }
        configureUI()
        addGestureRecognizerToAvatarImage()
        if let fr = friend {
            configure(friend: fr)
        }
    }
    
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func configure(friend: Users) {
        avatarImageView.image = friend.avatar
        nameLabel.text = friend.name
        propertyLabel.text = friend.age
    }

}

