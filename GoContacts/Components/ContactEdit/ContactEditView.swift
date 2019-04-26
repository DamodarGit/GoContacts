

import UIKit

final class ContactEditView: UIViewController {
    var presenter: ContactEditPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    
}

extension ContactEditView: ContactEditViewProtocol {

}

