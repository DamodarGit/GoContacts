

import UIKit

final class ContactListView: UIViewController {
    @IBOutlet weak var tableContactList: UITableView!
    
    var presenter: ContactListPresenterProtocol?

    var loader : Loader!
    lazy var count : Int = { return 0 }()
    var contacts:[Contact]!
    var sectionTiles =  [String]()
    
    var indexList  =  [Character: [Contact]]()
    
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
    
    func createListAndUpdateTable() {

        self.contacts = self.contacts.sorted { $0.first_name!.localizedCaseInsensitiveCompare($1.first_name!) == .orderedAscending }
        
        self.indexList = Dictionary(grouping: self.contacts, by: { $0.first_name!.lowercased().first! })
        
        sectionTiles = Array(self.indexList.keys).map {
            return "\($0)"
        }
        
        sectionTiles = sectionTiles.sorted()
        print(sectionTiles)
        
        DispatchQueue.main.async {
            self.toggleTableView(false)
            self.loader.hide()
            self.tableContactList!.sectionIndexColor = Color.gray
            self.tableContactList!.sectionIndexBackgroundColor = Color.clear
            self.tableContactList.reloadData()
        }
    }
}

extension ContactListView: ContactListViewProtocol {
    
    func didRecieved(contacts: [Contact]) {
        self.count = contacts.count
        self.contacts = contacts
        createListAndUpdateTable()
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
        return Array(self.indexList.values).count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTiles.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sectionTiles
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTiles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:ContactListCell.identifier) as! ContactListCell
        let contacts = Array(self.indexList.values)[indexPath.section]
        print(contacts.count)
        if contacts.count > indexPath.row {
            let contact =  Array(self.indexList.values)[indexPath.section][indexPath.row]
            cell.configure(contact)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let contacts = Array(self.indexList.values)[indexPath.section]
        print(contacts.count)
        if contacts.count > indexPath.row {
            let contact =  Array(self.indexList.values)[indexPath.section]
            let selectedContact = contact[indexPath.row]
            self.presenter?.showDetail(self.navigationController!, with: selectedContact)
        }
}
   
}
