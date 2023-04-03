//
//  MenuTableViewCell.swift
//  PracticalTask03-2
//
//  Created by Sonun on 2/4/23.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    private var pizzaNameLabel: UILabel = {
        var nameLbl = UILabel()
        nameLbl.font = .boldSystemFont(ofSize: 28)
        nameLbl.lineBreakMode = .byWordWrapping
        nameLbl.numberOfLines = 2
        return nameLbl
    }()
    
    private var timeLabel: UILabel = {
        var timeLbl = UILabel()
        timeLbl.font = .systemFont(ofSize: 12)
        timeLbl.textColor = .gray
        return timeLbl
    }()
    
    private var priceLabel: UILabel = {
        var priceLbl = UILabel()
        priceLbl.font = .boldSystemFont(ofSize: 24)
        priceLbl.textColor = UIColor(named: "green")
        return priceLbl
    }()
    
    private let pizzaImage: UIImageView = {
        let pizzaIV = UIImageView()
        pizzaIV.clipsToBounds = true
        pizzaIV.contentMode = .scaleAspectFit
        return pizzaIV
    }()
    
    private let timeImage: UIImageView = {
        let timeIV = UIImageView()
        timeIV.image = UIImage(systemName:"clock")
        timeIV.tintColor = .gray
        return timeIV
    }()
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 8

        return addButton
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       
        contentView.addSubview(pizzaNameLabel)
        contentView.addSubview(pizzaImage)
        contentView.addSubview(timeLabel)
        contentView.addSubview(timeImage)
        contentView.addSubview(addButton)
        contentView.addSubview(priceLabel)
        
        pizzaNameLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.leading.equalTo(pizzaImage.snp.trailing).offset(20)
            make.top.equalToSuperview().offset(20)
        }
        
        pizzaImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(-100)
            make.bottom.equalToSuperview().offset(0)
            make.height.equalTo(216)
            make.width.equalTo(280)
            
        }
        
        timeImage.snp.makeConstraints { make in
            make.leading.equalTo(pizzaNameLabel.snp.leading)
            make.top.equalTo(pizzaNameLabel.snp.bottom).offset(20)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeImage)
            make.leading.equalTo(timeImage.snp.trailing).offset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(20)
            make.leading.equalTo(pizzaNameLabel)
        }
        
        addButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    func initData(model: TableViewData) {
        pizzaNameLabel.text = model.pizzaName
        pizzaImage.image = UIImage(named:model.pizzaImage)
        priceLabel.text = model.price
        timeLabel.text = model.time
    }
}
