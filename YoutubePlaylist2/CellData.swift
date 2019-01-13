//
//  CellData.swift
//  YoutubePlaylist2
//
//  Created by Yüksel Ağgöz on 26.12.2018.
//  Copyright © 2018 Yüksel Ağgöz. All rights reserved.
//

import Foundation
import UIKit

struct CellData: Codable {
    var kind: String
    var etag: String
    var nextPageToken: String
    var pageInfo: PageInfo
    var items = [Item]()
    
    struct PageInfo: Codable {
        var totalResults: Int
        var resultsPerPage: Int
    }
    
    struct Item: Codable {
        var kind: String
        var etag: String
        var id: String
        var snippet: Snippet
        
        struct Snippet: Codable {
            var publishedAt: String
            var channelId: String
            var title: String
            var description: String
            var thumbnails: Thumbnail
            var channelTitle: String
            var playlistId: String
            var position: Int
            var resourceId: ResourceId
            
            struct Thumbnail: Codable {
                var `default`: Resolution
                var medium: Resolution
                var high: Resolution
                var standard: Resolution
                var maxres: Resolution
                
                struct Resolution: Codable {
                    var url: String
                    var width: Int
                    var height: Int
                }
            }
            
            struct ResourceId: Codable {
                var kind: String
                var videoId: String
            }
        }
    }
}

