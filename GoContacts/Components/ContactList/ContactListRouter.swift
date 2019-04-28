
import UIKit
final class ContactListRouter: ContactListRouterProtocol {
    weak var view: ContactListViewProtocol?
    
    static func createModule() -> UIViewController {
        let view = StoryBoard.main.instantiateViewController(withIdentifier: Controller.contactList) as! ContactListView
        view.title = "Contact"
        let router = ContactListRouter()
        let interactor = ContactListInteractor()
        let presenter = ContactListPresenter(router: router, interactor: interactor)
        router.view = view
        view.presenter = presenter
        presenter.view = view
        interactor.output = presenter
        return view
    }
    
    func showDetailView(on navigationController: UINavigationController, with contact: Contact) {
        let detailView = ContactDetailRouter.createModule(with: contact)
        navigationController.pushViewController(detailView, animated: true)
    }
    
    func showAddContact(on navigationController: UINavigationController) {
        let contactView = ContactEditRouter.createModule(with: .add)
        navigationController.pushViewController(contactView, animated: true)
    }
}
