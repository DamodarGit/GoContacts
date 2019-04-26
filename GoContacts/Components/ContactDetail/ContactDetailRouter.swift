
import UIKit
final class ContactDetailRouter: ContactDetailRouterProtocol {
    weak var view: ContactDetailViewProtocol?
    
    static func createModule() -> UIViewController {
        let view = StoryBoard.main.instantiateViewController(withIdentifier: Controller.contactDetail) as! ContactDetailView
        let Router = ContactDetailRouter()
        let interactor = ContactDetailInteractor()
        let presenter = ContactDetailPresenter(Router: Router, interactor: interactor)
        Router.view = view
        view.presenter = presenter
        presenter.view = view
        interactor.output = presenter
        return view
    }
}
