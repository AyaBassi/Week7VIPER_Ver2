//
//  ViewController.swift
//  Week7FriViper2ndVersion
//
//  Created by Payam Karbassi on 13/05/2023.
//

import UIKit
protocol AnyViewProtocol{
    var presenter:AnyPresenterProtocol? { get set }
    func updateWithData(_ data:Entity)
    func updateError(with error:String)
}
class ViewController: UIViewController ,AnyViewProtocol,UITableViewDelegate,UITableViewDataSource{
    var presenter: AnyPresenterProtocol?
    var products : [Product] = []
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func updateWithData(with data: Entity) {
        DispatchQueue.main.async {
            self.products = data.products
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func updateWithData(_ data: Entity) {
        DispatchQueue.main.async {
            self.products = data.products
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    func updateError(with error: String) {
        print("DEBUG: THERE WAS AN ERROR \(error)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row].title
        return cell
    }
}
