import UIKit

protocol ContactListViewProtocol: class {
    var presenter: ContactListPresenterProtocol? { get }
}

protocol ContactListInteractorProtocol {
    var output: ContactListInteractorOutputProtocol? { get }    
}

protocol ContactListPresenterProtocol {
    var view: ContactListViewProtocol? { get }
    var interactor: ContactListInteractorProtocol { get }
    var Router: ContactListRouterProtocol { get }
    
    func onViewDidLoad()
}

protocol ContactListInteractorOutputProtocol: class {

}

protocol ContactListRouterProtocol {
    var view: ContactListViewProtocol? { get }
}

