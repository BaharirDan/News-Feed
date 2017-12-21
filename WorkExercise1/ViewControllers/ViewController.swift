//
//  ViewController.swift
//  WorkExercise1
//
//  Created by dan baharir on 31/10/2017.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var articles : [Article]?
    var sources : [FeedSource]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        FeedHelper.fetchArticlesFromFeed(completion: { (success,articles) -> Void in
            if success {
                print("articles fetched")
                self.articles = articles
                
                // reload the table view with the new Json data (run on main thread as we are running in the background thread here)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("articles failed to be fetched")
            }
        })
        
        FeedHelper.fetchSourcesFromFeed(completion: { (success,sources) -> Void in
            if success {
                print("sources fetched")
                self.sources = sources
                
                // reload only the table view sources row (section = 0) with the new Json data (run on main thread as we are running in the background thread here)
                DispatchQueue.main.async {
                    self.tableView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: .left)
                }
            } else {
                print("sources failed to be fetched")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setStatusBarBackgroundColor(color: UIColor) {
        
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }

    ////
    // UITableView Delegate Methods
    ////
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articles != nil ? articles!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = (self.tableView.dequeueReusableCell(withIdentifier: "NewsFeedCellStackViews") as? NewsFeedArticleCell)
    
        // set cell
        cell?.setCell(article: self.articles![indexPath.section])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.white
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else {
            return 4
        }
    }
}

