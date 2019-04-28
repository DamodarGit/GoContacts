
final class ContactDetailInteractor: ContactDetailInteractorProtocol {
    weak var output: ContactDetailInteractorOutputProtocol?
    
    func getDetailes(for id: Int) {
        ContactServices.shared.getContactDetails(id:id, completion: { result in
                                switch result {
                                case .success(let contactDetails):
                                    self.output?.showDetails(contactDetails!)
                                case .failure( let error):
                                    print(error)
                                    self.output?.show(error.localizedDescription)
                                }
        
                        })
    }
}
