//
//  HomeViewController.swift
//  iHunMovieApp
//
//  Created by Hưng Nguyễn on 18/02/2023.
//

import UIKit


enum Section: Int{
    case Nowplaying = 0
    case Toprated = 1
}

class HomeViewController: UIViewController {
    
    private let homeViewTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identify)
        return table
    }()
    
    
    let sectionTitles: [String] = ["Now playing","Top rated"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeViewTable)
        
        homeViewTable.delegate = self
        homeViewTable.dataSource = self
        
        configNavBar()
        
        homeViewTable.tableHeaderView = PosterMovieHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeViewTable.frame = view.bounds
    }
    
    private func configNavBar(){
        navigationController?.navigationBar.tintColor = .systemRed
        let user = UIImage(systemName: "person.fill")
        let list = UIImage(systemName: "text.append")
        var imageLogo = UIImage(named: "netflix_logo")
        imageLogo =  imageLogo?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageLogo, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: user, style: .done, target: self, action: nil),
            UIBarButtonItem(image: list, style: .done, target: self, action: nil)
        ]
    }
    
}


extension HomeViewController: UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identify, for: indexPath) as? CollectionTableViewCell else{
            return UITableViewCell()
        }
        switch indexPath.section {
        case Section.Toprated.rawValue:
            APICaller.shared.getTopRatedMovies{
                results in
                switch results {
                case .success(let success):
                    cell.config(with: success)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
            
        case Section.Nowplaying.rawValue:
            APICaller.shared.getNowplayingMovies{
                results in
                switch results {
                case .success(let success):
                    cell.config(with: success)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
            
        default:
            return  UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18,weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x+20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        
    }
}


