//
//  PhotoInfoViewController.swift
//  Photorama-Ahlam
//
//  Created by ahlam  on 09/05/1443 AH.
//

import Foundation

class Photo : Codable {
    let title: String
    let remoteURL: URL?
    let photoID: String
    let dateTaken: Date
    
    enum CodingKeys: String, CodingKey {
            case title
            case remoteURL = "url_z"
            case photoID = "id"
            case dateTaken = "datetaken"
    }
}

extension Photo: Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        // Two Photos are the same if they have the same photoID
        return lhs.photoID == rhs.photoID
    }
}
