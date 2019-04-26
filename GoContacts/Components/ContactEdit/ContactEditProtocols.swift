
protocol ContactEditViewProtocol: class {
    var presenter: ContactEditPresenterProtocol? { get }
}

protocol ContactEditInteractorProtocol {
    var output: ContactEditInteractorOutputProtocol? { get }
}

protocol ContactEditPresenterProtocol {
    var view: ContactEditViewProtocol? { get }
    var interactor: ContactEditInteractorProtocol { get }
    var Router: ContactEditRouterProtocol { get }
    func onViewDidLoad()   
}

protocol ContactEditInteractorOutputProtocol: class {

}

protocol ContactEditRouterProtocol {
    var view: ContactEditViewProtocol? { get }
}

