//
//  Environment.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 09/07/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public enum Environment {
    private enum Keys {
        static let getPhotoURL = "GET_PHOTO_URL"
        static let getPhotosURL = "GET_PHOTOS_URL"
        static let bboxmongoURL = "BBOXMONGO_URL"
        static let tilesGeojsonURL = "TILES_GEOJSON_URL"
        static let tilesJpegURL = "TILES_JPEG_URL"
        static let getCommentsURL = "GET_COMMENTS_URL"
        static let getCollectionURL = "GET_COLLECTION_URL"
        static let getLocationEntitiesURL = "GET_LOCATION_ENTITIES_URL"
    }
    
    private static let infoDictionary: [String: Any]? = {
        guard let dictionary = Bundle.main.infoDictionary else {
            return nil
        }
        return dictionary
    }()
    
    private static func urlStringFor(_ key: String) -> String? {
        guard let urlString = Environment.infoDictionary?[key] as? String else {
            return nil
        }
        return urlString
    }
    
    public static let getPhotoURL: String = {
        return Environment.urlStringFor(Keys.getPhotoURL) ?? "https://prod.streetography.com/v1/photos/%@"
    }()
    
    public static let bboxmongoURL: String = {
        return Environment.urlStringFor(Keys.bboxmongoURL) ?? "https://tiles.streetography.com/bboxmongo"
    }()
    
    public static let tilesGeojsonURL: String = {
        return Environment.urlStringFor(Keys.tilesGeojsonURL) ?? "https://tiles.streetography.com/tile/%d/%d/%d.geojson"
    }()
    
    public static let tilesJpegURL: String = {
        return Environment.urlStringFor(Keys.tilesJpegURL) ?? "https://tiles.streetography.com/tile/%d/%d/%d.jpeg"
    }()
    
    public static let getCommentsURL: String = {
        return Environment.urlStringFor(Keys.getCommentsURL) ?? "https://prod.streetography.com/v1/photos/%@/comments"
    }()
    
    public static let getCollectionURL: String = {
        return Environment.urlStringFor(Keys.getCollectionURL) ?? "https://prod.streetography.com/v1/legacy-geo/collection"
    }()
    
    public static let getLocationEntitiesURL: String = {
        return Environment.urlStringFor(Keys.getLocationEntitiesURL) ?? "https://prod.streetography.com/v1/legacy-geo/point"
    }()
    
    public static let getPhotosURL: String = {
        return Environment.urlStringFor(Keys.getPhotosURL) ?? "https://prod.streetography.com/v1/legacy-geo/mcollection"
    }()
}
