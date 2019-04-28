

import UIKit

final class ContactEditView: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var textFields: [UITextField]?
    var editingContact: Contact?
    
    
    var presenter: ContactEditPresenterProtocol?
    var addOrEditOption:AddOrEditContactOption?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        
        if addOrEditOption == .edit {
            print("editing")
            guard let firstName = self.editingContact!.first_name,
                let lastName = self.editingContact!.last_name,
                let email = self.editingContact!.email,
                let mobile = self.editingContact!.phone_number else {return}
            
            self.firstNameTextField.text = firstName
            self.lastNameTextField.text = lastName
            self.mobileTextField.text = mobile
            self.emailTextField.text = email
            
        }
        else {
            print("Adding")
        }
        self.setupViews()
    }
    
    func setupViews() {
        self.textFields = [self.firstNameTextField, self.lastNameTextField, self.emailTextField, self.mobileTextField]
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func doneButtonAction() {
      
        if self.addOrEditOption == .edit {
            let contact = Contact.init(first_name: self.firstNameTextField.text,
                                       last_name: self.lastNameTextField.text,
                                       email: self.emailTextField.text,
                                       mobile: self.editingContact?.mobile,
                                       phone_number: self.mobileTextField?.text,
                                       favorite: self.editingContact?.favorite,
                                       id: self.editingContact?.id,
                                       profile_pic: self.editingContact?.profile_pic)

            self.presenter?.update(contact: contact, backToControler: self.navigationController!)

        } else {
            
            guard let firstName = self.firstNameTextField?.text,
                let lastName = self.lastNameTextField?.text,
                let email = self.emailTextField?.text,
                let mobile = self.mobileTextField?.text else {return}
            

            let contact = Contact.init(first_name: firstName, last_name: lastName, email: email, mobile: nil, phone_number: mobile, favorite: false, id: nil, profile_pic: nil)

            self.presenter?.add(contact: contact, backToControler: self.navigationController!)

        }

        
    }
    
    @IBAction func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ContactEditView :  UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField != mobileTextField {
            textField.returnKeyType = .next
        } else {
            textField.returnKeyType = .done
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {


        let nextField = self.textFields?.filter{ return (textField.tag + 1)  ==  $0.tag}
        textField.resignFirstResponder()
        nextField?.first?.becomeFirstResponder()

        return true
    }
}

extension ContactEditView: ContactEditViewProtocol {
    func showError(_ error: String) {
        
    }
    
}

