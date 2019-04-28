
import UIKit

protocol ContactEditViewProtocol: class {
    var presenter: ContactEditPresenterProtocol? { get }
    func showError(_ error: String)
}

protocol ContactEditInteractorProtocol {
    var output: ContactEditInteractorOutputProtocol? { get }
    func update(contact: Contact, controller: UINavigationController)
    func add(contact: Contact, controller: UINavigationController)

}

protocol ContactEditPresenterProtocol {
    var view: ContactEditViewProtocol? { get }
    var interactor: ContactEditInteractorProtocol { get }
    var router: ContactEditRouterProtocol { get }
    func onViewDidLoad()
    func update(contact: Contact, backToControler: UINavigationController)
    func add(contact: Contact, backToControler: UINavigationController)

}

protocol ContactEditInteractorOutputProtocol: class {
    func show(error: String)
    func onSuccess(_ navigation: UINavigationController)
}

protocol ContactEditRouterProtocol {
    var view: ContactEditViewProtocol? { get }
    func backToController(_ navigation: UINavigationController)
}

