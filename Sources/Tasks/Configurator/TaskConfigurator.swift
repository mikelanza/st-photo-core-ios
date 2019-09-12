//
//  TaskConfigurator.swift
//  STPhotoCore-iOS
//
//  Created by Crasneanu Cristian on 12/09/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

class TaskConfigurator {
    static let shared = TaskConfigurator()
    
    private init() { }
    
    func photoCommentsTask() -> PhotoCommentsTaskProtocol {
        return PhotoCommentsNetworkTask()
    }
    
    func photoTask() -> PhotoTaskProtocol {
        return PhotoNetworkTask()
    }
    
    func imageTask() -> ImageTaskProtocol {
        return ImageNetworkTask()
    }
    
    func photoCollectionTask() -> PhotoCollectionTaskProtocol {
        return PhotoCollectionNetworkTask()
    }
    
    func locationAddressTask() -> LocationAddressTaskProtocol {
        return LocationAddressNetworkTask()
    }
    
    func locationEntitiesTask() -> LocationEntitiesTaskProtocol {
        return LocationEntitiesNetworkTask()
    }
    
    func photosTask() -> PhotosTaskProtocol {
        return PhotosNetworkTask()
    }
}

