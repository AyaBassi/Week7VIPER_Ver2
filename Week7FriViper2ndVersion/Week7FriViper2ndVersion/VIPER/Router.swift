//
//  Router.swift
//  Week7FriViper2ndVersion
//
//  Created by Payam Karbassi on 13/05/2023.
//

import UIKit

typealias AnyViewProtocol_UIViewController = AnyViewProtocol & UIViewController

protocol AnyRouterProtocol{
    var rootView : AnyViewProtocol_UIViewController?{get}
    static func start() -> AnyRouterProtocol
}
class Router: AnyRouterProtocol {
    var rootView: AnyViewProtocol_UIViewController?
    
    static func start()-> AnyRouterProtocol {
        let router = Router()
        let viewController : AnyViewProtocol = ViewController()
    
        
        
        
        
        
        
        router.rootView = viewController as? AnyViewProtocol_UIViewController
        return router
    }
    
    
    
}
