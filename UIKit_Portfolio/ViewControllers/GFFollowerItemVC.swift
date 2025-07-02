//
//  GFFollowerItemVC.swift
//  UIKit_Portfolio
//
//  Created by Javier FO on 15/06/25.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemPurple, title: "Get Followers", systemImageName: "person.2")
    }

    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}

