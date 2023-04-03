//
//  SectionCollectionViewCell.swift
//  PracticalTask03-2
//
//  Created by Sonun on 2/4/23.
//

import UIKit

class SectionCollectionViewCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let backView: UIView = {
        let bgView = UIView()
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.gray.cgColor
        bgView.layer.cornerRadius = 8
        return bgView
    }()
    
    func initCell(data: CollectionViewData) {
        label.text = data.sectionName
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backView)
        backView.addSubview(label)
        
        backView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
            make.width.equalTo(80)
        }
        
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
