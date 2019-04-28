
import UIKit
final class ContactEditRouter: ContactEditRouterProtocol {
    
    
    weak var view: ContactEditViewProtocol?
    
    static func createModule(with option: AddOrEditContactOption, contact: Contact?) -> UIViewController {
       // let view = ContactEditView()
        let view = StoryBoard.main.instantiateViewController(withIdentifier: Controller.addOrEdit) as! ContactEditView
        view.addOrEditOption = option
        view.editingContact = contact
        let router = ContactEditRouter()
        let interactor = ContactEditInteractor()
        let presenter = ContactEditPresenter(router: router, interactor: interactor)
        router.view = view
        view.presenter = presenter
        presenter.view = view
        interactor.output = presenter
        return view
    }
    
    func backToController(_ navigation: UINavigationController) {
        navigation.popViewController(animated: true)
    }
}
