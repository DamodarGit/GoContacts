

import UIKit

final class ContactDetailView: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var tableDetaila: UITableView!
    @IBOutlet weak var buttonFavourite: UIButton!

    
    var presenter: ContactDetailPresenterProtocol?
    var contact: Contact!
    var loader : Loader!
    
    var dataDictionary = [String: String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        presenter?.getInfo(for: self.contact.id!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupViews() {
        
        self.navigationController?.navigationBar.isHidden = true
        self.loader = Loader(view: self.view)
        
        guard let path = self.contact.profile_pic,
            let firstName = self.contact.first_name,
            let lastName = self.contact.last_name
            else { return }

        self.fullNameLabel.text = firstName + " " + lastName
        self.fullNameLabel.type(.semi_bold)

        self.profileImage.rounded()
        self.profileImage.layer.borderWidth = 3
        self.profileImage.layer.borderColor = Color.white.cgColor
        self.profileImage.getImagage(url:path)
        
        self.tableDetaila.tableFooterView = UIView()
        self.tableDetaila.tableHeaderView = UIView()
        self.tableDetaila.separatorColor = Color.borderColor
        
    }
    
    @IBAction func rightBarButtonAction() {
        self.presenter?.showEditView(for: self.contact, with: self.navigationController!)
    }
    
    @IBAction func leftBarButtonAction() {
        self.presenter?.pop(self.navigationController!)
    }
 
    func createDataDict() {
        
        guard let favorite = self.contact.favorite else { return }
       
        self.dataDictionary = Dictionary()
        self.dataDictionary["mobile"] = self.contact.phone_number
        self.dataDictionary["email"] = self.contact.email
        DispatchQueue.main.async {
            self.tableDetaila.reloadData()
            if favorite {
                self.buttonFavourite.setBackgroundImage(UIImage(named: "Fav_filled"), for: .normal)
            }
            else {
                self.buttonFavourite.setBackgroundImage(UIImage(named: "Fav"), for: .normal)
            }
        }
    }
    
}

extension ContactDetailView: ContactDetailViewProtocol {
    
    func showLoader() {
        self.loader.show()
    }
    
    func showDetails(_ contact: Contact) {
        self.loader.hide()
        self.contact = contact
        self.createDataDict()
    }
    
    func show(_ error: String) {
        self.loader.hide()
    }
    
}


extension ContactDetailView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactDetailCell.identifier) as! ContactDetailCell
        
        let value = Array(self.dataDictionary.values)[indexPath.row]
        let key: String = Array(self.dataDictionary.keys)[indexPath.row]
            cell.configure(key, value: value)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

