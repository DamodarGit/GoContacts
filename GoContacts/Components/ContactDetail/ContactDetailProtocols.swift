import UIKit

protocol ContactDetailViewProtocol: class {
    var presenter: ContactDetailPresenterProtocol? { get }
    func showLoader()
    func showDetails(_ contact: Contact)
    func show(_ error:String)

}

protocol ContactDetailInteractorProtocol {
    var output: ContactDetailInteractorOutputProtocol? { get }
    func getDetailes(for id:Int)
}

protocol ContactDetailPresenterProtocol {
    var view: ContactDetailViewProtocol? { get }
    var interactor: ContactDetailInteractorProtocol { get }
    var router: ContactDetailRouterProtocol { get }
    func onViewDidLoad()
    func getInfo(for id: Int)
    func pop(_ controller: UINavigationController)
    func showEditView(for contact: Contact, with navigationController: UINavigationController)
}

protocol ContactDetailInteractorOutputProtocol: class {
    func showDetails(_ contact: Contact)
    func show(_ error:String)
}

protocol ContactDetailRouterProtocol {
   var view: ContactDetailViewProtocol? { get }
    func showEditView(_ contact: Contact, with navigationController:UINavigationController)
    func pop(_ controller: UINavigationController)
}

