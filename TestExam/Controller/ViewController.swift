//
//  ViewController.swift
//  TestExam
//
//  Created by mercantile on 2019-07-04.
//  Copyright © 2019 Rabirb. All rights reserved.
//

import UIKit
import AlamofireImage
import MKProgress

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var txtSearch: UITextField!
    
    let tCell = "HomeTVC"
    var images = [Images]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    //MARK: - UI
    func setupUI() {
        fetchApiData()
        self.title = "Home"
        setupTableView()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 130.0
    }
    
    func fetchApiData() {
        MKProgress.show(true)
        ImageServices().makeNetworkCall(url: ApiUrl.latestImage, compltion: {(imageLists) in
            print(imageLists)
            self.images = imageLists
            self.tableView.reloadData()
            MKProgress.hide(true)
        }, failure: { (error) in
            print(error)
            MKProgress.hide(true)
        })
    }
    
    //MARK: -IBAction
    @IBAction func btnSearch(_ sender: Any) {
        view.endEditing(true)
        self.images.removeAll()
        MKProgress.show(true)
        ImageServices().makeNetworkCall(url: ApiUrl.serachLists(key: txtSearch.text!), compltion: {(imageLists) in
            print(imageLists)
            self.images = imageLists
            self.tableView.reloadData()
            MKProgress.hide(true)
        }, failure: { (error) in
            print(error)
            MKProgress.hide(true)
        })
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    //MARK: - UITableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: tCell, for: indexPath) as! HomeTableViewCell
        cell.imgDisplay.af_setImage(withURL: URL(string: images[indexPath.row].url!)!)
        return cell
        
    }
    
    //MARK: - UITableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ImageDetailVC")  as! ImageDetailViewController
        vc.imgUrl = images
        vc.currentIndex = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

