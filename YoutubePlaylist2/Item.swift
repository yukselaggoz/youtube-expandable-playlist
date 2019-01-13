//
//  Item.swift
//  YoutubePlaylist2
//
//  Created by Yüksel Ağgöz on 2.01.2019.
//  Copyright © 2019 Yüksel Ağgöz. All rights reserved.
//

import UIKit

class Item {
    var title:String?
    var desc:String?
    var image:UIImage?
    var imageURL: URL?
    var isClosed: Bool!
    
    class func getItemFromDict(dict:[String:Any]) -> Item {
        let item = Item()
        
        let snippet = dict["snippet"] as! [String:Any]
        item.title = snippet["title"] as? String
        item.desc = snippet["description"] as? String
        let thumbnails = snippet["thumbnails"] as! [String: Any]
        let defaultimg = thumbnails["default"] as! [String: Any]
        let imageStr = defaultimg["url"] as! String
        item.imageURL = URL(string: imageStr)
        //let imageData = try! Data(contentsOf: item.imageURL!)
        //item.image = UIImage(data: imageData)
        item.isClosed = true
        
        return item
    }
}
