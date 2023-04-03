import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var collectionViewData: [CollectionViewData] = []
    private var tableViewData: [TableViewData] = []
    
    private var greatingLabel: UILabel = {
        var greatingLbl = UILabel()
        greatingLbl.text = "Hello, Sarah"
        greatingLbl.font = .systemFont(ofSize: 12)
        return greatingLbl
    }()
    
    private var welcomeLabel: UILabel = {
        var welcomeLbl = UILabel()
        welcomeLbl.text = "Welcome Back!"
        welcomeLbl.font = .boldSystemFont(ofSize: 32)
        return welcomeLbl
    }()
    
    private let searchBar = UISearchBar()
    
    private let bellImage: UIImageView = {
        let bellIV = UIImageView()
        bellIV.image = UIImage(named: "bell")
        return bellIV
    }()
    
    private let backImage: UIImageView = {
        let backIV = UIImageView()
        backIV.image = UIImage(named: "back")
        return backIV
    }()
    
    private let filterImage: UIImageView = {
        let filterIV = UIImageView()
        filterIV.image = UIImage(named: "filter")
        return filterIV
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 8.0
        layout.estimatedItemSize = CGSize(width: 80, height: 40)
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(SectionCollectionViewCell.self, forCellWithReuseIdentifier: "SectionCollectionViewCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        
        initUi()
        
        collectionViewData = [CollectionViewData(sectionName: "All"), CollectionViewData(sectionName: "Pizza"),
            CollectionViewData(sectionName: "Fast food"),
            CollectionViewData(sectionName: "Vegan" ),
            CollectionViewData(sectionName: "Salad"),
            CollectionViewData(sectionName: "Tea"),
            CollectionViewData(sectionName: "Dessert")]
        
       tableViewData = [TableViewData(pizzaImage: "pizza2", pizzaName: "Assorti", time: "15-20 minutes", price: "$12"),
        TableViewData(pizzaImage: "pizza1", pizzaName: "Italian pizza", time: "20-25 minutes", price: "$16"),
        TableViewData(pizzaImage: "pizza3", pizzaName: "Pepperoni cheese pizza", time: "20-25 minutes", price: "$13")]
    }
    
    private func initUi() {
        
        view.addSubview(greatingLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(bellImage)
        view.addSubview(collectionView)
        view.addSubview(tableView)
        view.addSubview(searchBar)
        view.addSubview(backImage)
        backImage.addSubview(filterImage)
        
        
        greatingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56)
            make.leading.equalToSuperview().offset(24)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(greatingLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
        }
        
        bellImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(56)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalTo(filterImage.snp.leading).offset(-24)
            make.height.equalTo(32)
        }
        
        backImage.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        filterImage.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(searchBar).offset(56)
            make.height.equalTo(60)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(collectionView.snp.bottom).offset(56)
            make.bottom.equalToSuperview().offset(0)
        }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCollectionViewCell", for: indexPath) as! SectionCollectionViewCell
        let data = collectionViewData[indexPath.row]
        cell.initCell(data: data)
        return cell
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        let model = tableViewData[indexPath.row]
        cell.initData(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        vc.navigationItem.title = "Detail"
        let model = tableViewData[indexPath.row]
        vc.initData(model: model)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
}
