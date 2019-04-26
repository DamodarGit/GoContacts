
import UIKit
final class ContactListRouter: ContactListRouterProtocol {
    weak var view: ContactListViewProtocol?
    
    static func createModule() -> UIViewController {
        let view = StoryBoard.main.instantiateViewController(withIdentifier: Controller.contactList) as! ContactListView
        view.title = "Contact"
        let Router = ContactListRouter()
        let interactor = ContactListInteractor()
        let presenter = ContactListPresenter(Router: Router, interactor: interactor)
        Router.view = view
        view.presenter = presenter
        presenter.view = view
        interactor.output = presenter
        return view
    }
}
