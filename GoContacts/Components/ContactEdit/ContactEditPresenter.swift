import UIKit

final class ContactEditPresenter: ContactEditPresenterProtocol {
    var interactor: ContactEditInteractorProtocol
    var router: ContactEditRouterProtocol
    weak var view: ContactEditViewProtocol?
    
    init(router: ContactEditRouterProtocol, interactor: ContactEditInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
    
    }
    
    func update(contact: Contact, backToControler: UINavigationController) {
        self.interactor.update(contact: contact, controller: backToControler)
    }
    
    func add(contact: Contact, backToControler: UINavigationController) {
        self.interactor.add(contact: contact, controller: backToControler)
    }
}

extension ContactEditPresenter: ContactEditInteractorOutputProtocol {
    func onSuccess(_ navigation: UINavigationController) {
        self.router.backToController(navigation)
    }
    
    func show(error: String) {
        self.view?.showError(error)
    }
    
}

