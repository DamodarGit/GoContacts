import UIKit

final class ContactListPresenter: ContactListPresenterProtocol {
    var interactor: ContactListInteractorProtocol
    var Router: ContactListRouterProtocol
    weak var view: ContactListViewProtocol?
    
    init(Router: ContactListRouterProtocol, interactor: ContactListInteractorProtocol) {
        self.Router = Router
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
    
    }
}

extension ContactListPresenter: ContactListInteractorOutputProtocol {
    
}

