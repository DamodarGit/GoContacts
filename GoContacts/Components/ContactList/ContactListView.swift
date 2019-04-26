

import UIKit

final class ContactListView: UIViewController {
    var presenter: ContactListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigation()
    }
    
    func setupNavigation() {
        let leftBarButton = UIBarButtonItem(title: "Group", style: .plain, target: self, action: #selector(leftBarButtonAction))
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarButtonAction))
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func leftBarButtonAction() {
        print("L")
    }
    
    @objc func rightBarButtonAction() {
        print("R")
    }

}

extension ContactListView: ContactListViewProtocol {

}

