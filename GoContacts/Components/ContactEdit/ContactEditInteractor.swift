import UIKit

final class ContactEditInteractor: ContactEditInteractorProtocol {
    weak var output: ContactEditInteractorOutputProtocol?
    
    func update(contact: Contact, controller: UINavigationController) {
        ContactServices.shared.put(contact) { (result) in
            switch result {
            case .success( _):
                self.output?.onSuccess(controller)
            case .failure( let error):
                self.output?.show(error: error.localizedDescription)
            }
        }
    }
    
    func add(contact: Contact, controller: UINavigationController) {
        ContactServices.shared.createContact(contact: contact) { (result) in
            switch result {
            case .success( _):
                self.output?.onSuccess(controller)
            case .failure( let error):
                self.output?.show(error: error.localizedDescription)
                
            }
        }
    }
}

