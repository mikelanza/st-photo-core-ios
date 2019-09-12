//
//  RepeatingTimer.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 23/05/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public class RepeatingTimer {
    let timeInterval: TimeInterval
    public var eventHandler: (() -> Void)?
    
    public init(timeInterval: TimeInterval, eventHandler: (() -> Void)? = nil) {
        self.timeInterval = timeInterval
        self.eventHandler = eventHandler
    }
    
    private lazy var timer: DispatchSourceTimer = {
        let t = DispatchSource.makeTimerSource()
        t.schedule(deadline: .now() + self.timeInterval, repeating: self.timeInterval)
        t.setEventHandler(handler: { [weak self] in
            self?.eventHandler?()
        })
        return t
    }()
    
    private enum State {
        case suspended
        case resumed
    }
    
    private var state: State = .suspended
    
    deinit {
        self.timer.setEventHandler {}
        self.timer.cancel()
        
        self.resume()
        self.eventHandler = nil
    }
    
    public func resume() {
        if self.state == .resumed {
            return
        }
        self.state = .resumed
        self.timer.resume()
    }
    
    public func suspend() {
        if self.state == .suspended {
            return
        }
        self.state = .suspended
        self.timer.suspend()
    }
}
