//
//  ViewController.swift
//  YoutubePlaylist2
//
//  Created by Yüksel Ağgöz on 26.12.2018.
//  Copyright © 2018 Yüksel Ağgöz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TableViewController: UITableViewController {

    var dataArray = [Item]()
    
    override func viewDidLoad() {
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "customcell")
        
        let url = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&playlistId=PLq0d8WFoUs5c9KCFo4u53BcGeWZglZiC9&key=AIzaSyD5DD8zwtuj3X6-TyG7BYmph9p2aZIpzY4"
        Alamofire.request(url).responseJSON { response in
            
            let results = response.result
            if let data = results.value as? Dictionary<String, Any> {
                if let items = data["items"] as? [[String: Any]] {
                    
                    for item in items {
                        let item = Item.getItemFromDict(dict: item)
                        self.dataArray.append(item)
                    }
                    self.tableView.reloadData()
                }
            }
        }
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") as! CustomCell
        
        //cell.imgVideo.image = dataArray[indexPath.row].image
        cell.lblTitle.text = dataArray[indexPath.row].title
        cell.lblDescription.text = dataArray[indexPath.row].desc
        cell.imgVideo.af_setImage(withURL: dataArray[indexPath.row].imageURL!)
        
        cell.setExpand(isHidden: dataArray[indexPath.row].isClosed)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch dataArray[indexPath.row].isClosed {
        case true:
            dataArray[indexPath.row].isClosed = false
            break
        case false:
            dataArray[indexPath.row].isClosed = true
            break
        case .none:
            break
        case .some(_):
            break
        }
        //self.tableView.reloadData()
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        self.tableView.endUpdates()
    }
}
