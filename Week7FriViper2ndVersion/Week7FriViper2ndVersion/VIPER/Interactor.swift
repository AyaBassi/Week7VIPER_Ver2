//
//  Interactor.swift
//  Week7FriViper2ndVersion
//
//  Created by Payam Karbassi on 13/05/2023.
//

import Foundation
protocol AnyInteractorProtocol {
    var presenter:AnyPresenterProtocol?{get set}
    func getData(urlString:String,anynetworkManager:NetworkableProtocol)async
}
class Interactor: AnyInteractorProtocol{
    var presenter: AnyPresenterProtocol?
    
    func getData(urlString: String, anynetworkManager: NetworkableProtocol) async {
        guard let result = try? await anynetworkManager.getData(urlString: urlString) else {return}
        presenter?.interactorDidFetchData(with: result)
    }
}
