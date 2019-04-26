

import UIKit

final class ContactDetailView: UIViewController {
    var presenter: ContactDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    
}

extension ContactDetailView: ContactDetailViewProtocol {

}

