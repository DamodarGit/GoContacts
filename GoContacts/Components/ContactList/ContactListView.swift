

import UIKit

final class ContactListView: UIViewController {
    @IBOutlet weak var tableContactList: UITableView!
    
    var presenter: ContactListPresenterProtocol?

    var loader : Loader!
    lazy var count : Int = { return 0 }()
    var contacts:[Contact]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.onViewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupViews() {

        let leftBarButton = UIBarButtonItem(title: BarButtonTitle.group, style: .plain, target: self, action: #selector(leftBarButtonAction))
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarButtonAction))
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
        tableContactList.separatorColor = Color.borderColor
        self.loader = Loader(view: self.view)
        self.toggleTableView(true)
    }
    
    @objc func leftBarButtonAction() {

    }
    
    @objc func rightBarButtonAction() {
        self.presenter?.showAddContact(on: self.navigationController!)
    }
    
    func toggleTableView(_ show: Bool)  {
        self.tableContactList.isHidden = show
    }

}

extension ContactListView: ContactListViewProtocol {
    
    func didRecieved(contacts: [Contact]) {
        self.count = contacts.count
        self.contacts = contacts
        DispatchQueue.main.async {
            self.toggleTableView(false)
            self.loader.hide()
            self.tableContactList.reloadData()
        }
    }
    
    func didFailedWith(eror: String) {
        self.loader.hide()
    }
    
    func showLoader() {
        self.loader?.show()
    }
}


extension ContactListView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:ContactListCell.identifier) as! ContactListCell
        let contact = self.contacts[indexPath.row]
        cell.configure(contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedContact = self.contacts[indexPath.row]
        self.presenter?.showDetail(self.navigationController!, with: selectedContact)
    }
}
