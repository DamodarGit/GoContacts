
import UIKit
final class ContactEditRouter: ContactEditRouterProtocol {
    weak var view: ContactEditViewProtocol?
    
    static func createModule() -> UIViewController {
       // let view = ContactEditView()
        let view = StoryBoard.main.instantiateViewController(withIdentifier: Controller.editContact) as! ContactEditView
        let Router = ContactEditRouter()
        let interactor = ContactEditInteractor()
        let presenter = ContactEditPresenter(Router: Router, interactor: interactor)
        Router.view = view
        view.presenter = presenter
        presenter.view = view
        interactor.output = presenter
        return view
    }
}
