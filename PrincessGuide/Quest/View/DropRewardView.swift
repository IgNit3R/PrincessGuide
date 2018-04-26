//
//  DropRewardView.swift
//  PrincessGuide
//
//  Created by zzk on 2018/4/26.
//  Copyright © 2018 zzk. All rights reserved.
//

import UIKit

class DropRewardView: UIView {
    
    let itemIcon = IconImageView()
    
    let rateLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(itemIcon)
        itemIcon.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.height.width.equalTo(64)
        }
        
        rateLabel.font = UIFont.scaledFont(forTextStyle: .caption1, ofSize: 12)
        rateLabel.textColor = .darkGray
        addSubview(rateLabel)
        rateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemIcon.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    func configure(for reward: Drop.Reward, isFocused: Bool = false) {
        rateLabel.text = "\(reward.odds)%"
        invalidateIntrinsicContentSize()
        if reward.rewardType == 4 {
            itemIcon.equipmentID = reward.rewardID
        } else {
            itemIcon.itemID = reward.rewardID
        }
        setHighlighted(isFocused)
    }
    
    private(set) var isHighlighted: Bool = false
    
    private func setHighlighted(_ isHighlighted: Bool) {
        self.isHighlighted = isHighlighted
        if isHighlighted {
            itemIcon.layer.borderColor = UIColor.red.cgColor
            itemIcon.layer.borderWidth = 2
            itemIcon.layer.cornerRadius = 6
            itemIcon.layer.masksToBounds = true
            rateLabel.textColor = .red
        } else {
            itemIcon.layer.borderWidth = 0
            rateLabel.textColor = .darkGray
        }
    }
        
    override var intrinsicContentSize: CGSize {
        let rateLabelSize = rateLabel.intrinsicContentSize
        return CGSize(width: 64, height: 64 + rateLabelSize.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
