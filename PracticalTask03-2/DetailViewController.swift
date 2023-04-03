//
//  DatailViewController.swift
//  PracticalTask03-2
//
//  Created by Sonun on 3/4/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var pizzaNameLabel: UILabel = {
        var nameLbl = UILabel()
        nameLbl.font = .boldSystemFont(ofSize: 28)
        nameLbl.lineBreakMode = .byWordWrapping
        nameLbl.numberOfLines = 2
        return nameLbl
    }()
    
    private var infoLabel: UILabel = {
        var infoLbl = UILabel()
        infoLbl.font = .boldSystemFont(ofSize: 22)
        infoLbl.text = "Choose the size"
        return infoLbl
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
        pizzaIV.layer.cornerRadius = 16
        return pizzaIV
    }()
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 8
        return addButton
    }()
    
    private let addToCardButton: UIButton = {
        let addToCardButton = UIButton()
        addToCardButton.setTitle("Add to card", for: .normal)
        addToCardButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        addToCardButton.backgroundColor = UIColor(named: "yellow")
        addToCardButton.layer.cornerRadius = 8
        return addToCardButton
    }()
    
    private let view1: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(pizzaImage)
        view.addSubview(pizzaNameLabel)
        view.addSubview(priceLabel)
        view.addSubview(infoLabel)
        view.addSubview(addToCardButton)
        view.addSubview(addButton)
        
        pizzaNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(144)
        }
        
        pizzaImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pizzaNameLabel.snp.bottom).offset(36)
            make.height.width.equalTo(285)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(pizzaImage)
            make.top.equalTo(pizzaImage.snp.bottom).offset(44)
        }
        
        addToCardButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-100)
            make.width.equalTo(180)
            make.height.equalTo(60)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-100)
        }
        
    }
    
    func initData(model: TableViewData) {
        pizzaNameLabel.text = model.pizzaName
        pizzaImage.image = UIImage(named:model.pizzaImage)
        priceLabel.text = model.price
        
        
    }

}
