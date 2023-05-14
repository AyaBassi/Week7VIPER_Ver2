//
//  Presenter.swift
//  Week7FriViper2ndVersion
//
//  Created by Payam Karbassi on 13/05/2023.
//

import Foundation

protocol AnyPresenterProtocol {
    var router      : AnyRouterProtocol?        { get set }
    var view        : AnyViewProtocol?          { get set }
    var interactor  : AnyInteractorProtocol?    { get set }
    func interactorDidFetchData<T,E:Error>(with result:Result<T,E>) where E:Error
}
class Presenter: AnyPresenterProtocol{
    var router      : AnyRouterProtocol?
    var view        : AnyViewProtocol?
    var interactor  : AnyInteractorProtocol?{
        didSet{
            Task{
                await interactor?.getData(urlString: APIEndPoints.api, anynetworkManager: NetworkManager())
            }
        }
    }
    
    func interactorDidFetchData<T, E>(with result: Result<T, E>) where E : Error {
        guard let result = result as? Result<Entity,NetworkError> else {return}
        switch result {
        case .success(let entity):
            view?.updateWithData(entity)
        case .failure(let error):
            view?.updateError(with: error.errorDescription ?? "Some error")
        }
    }
}
