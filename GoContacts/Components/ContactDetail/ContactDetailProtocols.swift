
protocol ContactDetailViewProtocol: class {
    var presenter: ContactDetailPresenterProtocol? { get }
}

protocol ContactDetailInteractorProtocol {
   var output: ContactDetailInteractorOutputProtocol? { get }
}

protocol ContactDetailPresenterProtocol {
   var view: ContactDetailViewProtocol? { get }
    var interactor: ContactDetailInteractorProtocol { get }
    var Router: ContactDetailRouterProtocol { get }
    func onViewDidLoad()   
}

protocol ContactDetailInteractorOutputProtocol: class {

}

protocol ContactDetailRouterProtocol {
   var view: ContactDetailViewProtocol? { get }
}

