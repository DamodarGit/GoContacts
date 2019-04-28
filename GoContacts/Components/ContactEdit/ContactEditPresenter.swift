
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
}

extension ContactEditPresenter: ContactEditInteractorOutputProtocol {
    
}

