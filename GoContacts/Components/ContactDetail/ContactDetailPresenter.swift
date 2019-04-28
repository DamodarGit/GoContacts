import  UIKit

final class ContactDetailPresenter: ContactDetailPresenterProtocol {
    var interactor: ContactDetailInteractorProtocol
    var router: ContactDetailRouterProtocol
    weak var view: ContactDetailViewProtocol?
    
    init(router: ContactDetailRouterProtocol, interactor: ContactDetailInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
    
    }
    
    func getInfo(for id:Int) {
        self.view?.showLoader()
        self.interactor.getDetailes(for: id)
    }
    
    func showEditView(for contact: Contact, with navigationController: UINavigationController) {
        self.router.showEditView(contact, with: navigationController)
    }
    
    func pop(_ controller: UINavigationController) {
        self.router.pop(controller)
    }
}

extension ContactDetailPresenter: ContactDetailInteractorOutputProtocol {
    
    func show(_ error: String) {
        self.view?.show(error)
    }
    
    func showDetails(_ contact: Contact) {
        self.view?.showDetails(contact)
    }
}

