import  UIKit

final class ContactListInteractor: ContactListInteractorProtocol {
    weak var output: ContactListInteractorOutputProtocol?

    func getAllContacts() {
        ContactServices.shared.getAllContacts { (result) in
            switch result {
            case .success( let contacts):
                self.output?.didRecievedContacts(contacts!)
            case .failure( let error):
                self.output?.didFailed(error.localizedDescription)
            }
        }
    }
}
