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
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 8
        bgView.setupShadowForView(6, 0, 7, opacity: 0.2)

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

extension UIView {
    ///setup shadow for view
    func setupShadowForView(_ radius: Int = 12,_ width: Int = 0,_ height: Int = 6, opacity: Float = 0.2){
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: CGFloat(width), height: CGFloat(height))
        layer.shadowRadius = CGFloat(radius)
        layer.shadowOpacity = opacity
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
