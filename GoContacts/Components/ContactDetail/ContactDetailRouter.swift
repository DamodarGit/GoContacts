
import UIKit
final class ContactDetailRouter: ContactDetailRouterProtocol {
    
    weak var view: ContactDetailViewProtocol?
    
    static func createModule(with contact: Contact) -> UIViewController {
        let view = StoryBoard.main.instantiateViewController(withIdentifier: Controller.contactDetail) as! ContactDetailView
        view.contact = contact
        let router = ContactDetailRouter()
        let interactor = ContactDetailInteractor()
        let presenter = ContactDetailPresenter(router: router, interactor: interactor)
        router.view = view
        view.presenter = presenter
        presenter.view = view
        interactor.output = presenter
        return view
    }
    
    func showEditView(_ contact: Contact, with navigationController: UINavigationController) {
        let contactView = ContactEditRouter.createModule(with: .edit)
        navigationController.pushViewController(contactView, animated: true)
    }
    
    func pop(_ controller: UINavigationController) {
        controller.popViewController(animated: true)
    }
}


