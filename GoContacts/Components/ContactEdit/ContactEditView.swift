

import UIKit

final class ContactEditView: UIViewController {
    var presenter: ContactEditPresenterProtocol?
    var addOrEditOption:AddOrEditContactOption?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        
        if addOrEditOption == .edit {
            print("editing")
        }
        else {
            print("Adding")
        }
        self.setupViews()
    }
    
    func setupViews() {
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func doneButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ContactEditView: ContactEditViewProtocol {

}

