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
    
    private let backView = UIView()
    
    func initCell(data: CollectionViewData) {
        label.text = data.sectionName
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backView)
        backView.addSubview(label)
        
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
            make.height.equalTo(32)
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
