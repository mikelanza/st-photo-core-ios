//
//  TaskConfigurator.swift
//  STPhotoCore-iOS
//
//  Created by Crasneanu Cristian on 12/09/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public class TaskConfigurator {
    public static let shared = TaskConfigurator()
    
    public var shouldRunLocally: Bool = false
    
    private init() { }
    
    func photoCommentsTask() -> PhotoCommentsTaskProtocol {
        return self.shouldRunLocally ? PhotoCommentsLocalTask() : PhotoCommentsNetworkTask()
    }
    
    func photoTask() -> PhotoTaskProtocol {
        return self.shouldRunLocally ? PhotoLocalTask() : PhotoNetworkTask()
    }
    
    func imageTask() -> ImageTaskProtocol {
        return self.shouldRunLocally ?  ImageLocalTask() : ImageNetworkTask()
    }
    
    func photoCollectionTask() -> PhotoCollectionTaskProtocol {
        return self.shouldRunLocally ?  PhotoCollectionLocalTask() : PhotoCollectionNetworkTask()
    }
    
    func locationAddressTask() -> LocationAddressTaskProtocol {
        return self.shouldRunLocally ?  LocationAddressLocalTask() : LocationAddressNetworkTask()
    }
    
    func locationEntitiesTask() -> LocationEntitiesTaskProtocol {
        return self.shouldRunLocally ?  LocationEntitiesLocalTask() : LocationEntitiesNetworkTask()
    }
    
    func photosTask() -> PhotosTaskProtocol {
        return self.shouldRunLocally ? PhotosLocalTask() : PhotosNetworkTask()
    }
}

