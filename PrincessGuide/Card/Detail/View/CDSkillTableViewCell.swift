//
//  CDSkillTableViewCell.swift
//  PrincessGuide
//
//  Created by zzk on 2018/4/20.
//  Copyright © 2018 zzk. All rights reserved.
//

import UIKit

class CDSkillTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    
    let categoryLabel = UILabel()
    
    let castTimeLabel = UILabel()
    
    let descLabel = UILabel()
    
    let actionView = SkillActionView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.font = UIFont.scaledFont(forTextStyle: .title3, ofSize: 16)
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(10)
        }
        
        categoryLabel.font = UIFont.scaledFont(forTextStyle: .title3, ofSize: 16)
        categoryLabel.textColor = .gray
        contentView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(nameLabel)
        }
        
        descLabel.font = UIFont.scaledFont(forTextStyle: .body, ofSize: 14)
        descLabel.textColor = .darkGray
        contentView.addSubview(descLabel)
        descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
        let subTitleLabel = createSubTitleLabel(title: NSLocalizedString("Cast Time", comment: ""))
        contentView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.top.equalTo(descLabel.snp.bottom).offset(5)
        }
        
        castTimeLabel.font = UIFont.scaledFont(forTextStyle: .body, ofSize: 14)
        castTimeLabel.textColor = .darkGray
        contentView.addSubview(castTimeLabel)
        castTimeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.top.equalTo(subTitleLabel.snp.bottom)
        }
        
        let subTitleLabel2 = createSubTitleLabel(title: NSLocalizedString("Skill Detail", comment: ""))
        contentView.addSubview(subTitleLabel2)
        subTitleLabel2.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.top.equalTo(castTimeLabel.snp.bottom).offset(5)
        }
        
        contentView.addSubview(actionView)
        actionView.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.top.equalTo(subTitleLabel2.snp.bottom).offset(5)
            make.bottom.equalTo(-10)
        }
        
    }
    
    private func createSubTitleLabel(title: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.scaledFont(forTextStyle: .title3, ofSize: 14)
        label.text = title
        return label
    }
    
    func configure(for skill: Skill, category: SkillCategory) {
        nameLabel.text = skill.base.name
        categoryLabel.text = category.description
        castTimeLabel.text = skill.base.skillCastTime
        descLabel.text = skill.base.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
