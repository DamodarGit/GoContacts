
final class ContactDetailPresenter: ContactDetailPresenterProtocol {
    var interactor: ContactDetailInteractorProtocol
    var Router: ContactDetailRouterProtocol
    weak var view: ContactDetailViewProtocol?
    
    init(Router: ContactDetailRouterProtocol, interactor: ContactDetailInteractorProtocol) {
        self.Router = Router
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
    
    }
}

extension ContactDetailPresenter: ContactDetailInteractorOutputProtocol {
    
}

