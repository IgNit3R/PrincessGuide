//
//  CardTableViewCell.swift
//  PrincessGuide
//
//  Created by zzk on 2018/4/9.
//  Copyright © 2018 zzk. All rights reserved.
//

import UIKit
import SnapKit

class CardTableViewCell: UITableViewCell {

    let cardView = CardView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cardView)
        cardView.snp.makeConstraints { (make) in
            make.left.right.equalTo(readableContentGuide)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
    }
    
    func configure(for card: Card) {
        cardView.configure(for: card)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
