

import UIKit

final class ContactDetailView: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var tableDetaila: UITableView!

    
    var presenter: ContactDetailPresenterProtocol?
    var contact: Contact!
    var loader : Loader!
    
    var dataDictionary = [String: String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.contact.last_name)
        self.setupViews()
        presenter?.getInfo(for: self.contact.id)
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
            else {
            return
        }

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
        
        self.dataDictionary = Dictionary()
        self.dataDictionary["mobile"] = self.contact.phone_number
        self.dataDictionary["email"] = self.contact.email
        DispatchQueue.main.async {
            self.tableDetaila.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailContactCell.identifier) as! DetailContactCell
        
        let value = Array(self.dataDictionary.values)[indexPath.row]
        
        let key: String = Array(self.dataDictionary.keys)[indexPath.row]
            cell.configure(key, value: value)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

class DetailContactCell : UITableViewCell {
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    static let identifier = "DetailContactCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        self.keyLabel.type(.regular)
        self.keyLabel.textColor = Color.lightGrey
        self.valueLabel.type(.regular)
        self.valueLabel.textColor = Color.gray
    }
    
    func configure(_ key : String, value: String)  {
        self.keyLabel.text = key
        self.valueLabel.text = value
    }
}
