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
        // Assign VIP_R
        let router = Router()
        var viewController  : AnyViewProtocol       = ViewController()
        var presenter       : AnyPresenterProtocol  = Presenter()
        var interactor      : AnyInteractorProtocol = Interactor()
        
        // set the 5 loose dependencies
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        router.rootView = viewController as? AnyViewProtocol_UIViewController
        return router
    }
    
    
    
}
