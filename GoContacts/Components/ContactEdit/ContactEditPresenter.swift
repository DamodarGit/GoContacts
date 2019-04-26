
final class ContactEditPresenter: ContactEditPresenterProtocol {
    var interactor: ContactEditInteractorProtocol
    var Router: ContactEditRouterProtocol
    weak var view: ContactEditViewProtocol?
    
    init(Router: ContactEditRouterProtocol, interactor: ContactEditInteractorProtocol) {
        self.Router = Router
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
    
    }
}

extension ContactEditPresenter: ContactEditInteractorOutputProtocol {
    
}

