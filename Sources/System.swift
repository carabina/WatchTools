//
//  System.swift
//  watchTest WatchKit Extension
//
//  Created by Vladas Zakrevskis on 12/1/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import WatchKit
import SwiftyTools

public enum WatchModel : CustomStringConvertible {

    case _38mm
    case _42mm
    
    public var description: String {
        switch self {
        case ._38mm: return "Apple Watch 38mm"
        case ._42mm: return "Apple Watch 42mm"
        }
    }
}

public extension CGSize {
    var pixels: CGSize { return CGSize(System.device.screenScale * System.screenSize.width,
                                       System.device.screenScale * System.screenSize.height) }
    
    var center: CGPoint { return CGPoint(width / 2, height / 2) }
}

public class System {
    
    public static var device: WKInterfaceDevice { return WKInterfaceDevice.current() }
    
    public static var model: WatchModel { return screenSize.height == CGFloat(170.0) ? ._38mm : ._42mm }
    public static var screenSize: CGSize { return device.screenBounds.size }
    public static var controllerSize: CGSize { return CGSize(screenSize.width, screenSize.height - 20) }
    public static var renderImageSize: CGSize { return CGSize(controllerSize.height, controllerSize.height).pixels }

}
