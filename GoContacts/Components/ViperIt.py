protocols_file = ("{module}/Protocols/{module}Protocols.swift",
'''
protocol {module}ViewProtocol: class {{
    var presenter: {module}PresenterProtocol? {{ get }}
}}

protocol {module}InteractorProtocol {{
    weak var output: {module}InteractorOutputProtocol? {{ get }}
}}

protocol {module}PresenterProtocol {{
    weak var view: {module}ViewProtocol? {{ get }}
    var interactor: {module}InteractorProtocol {{ get }}
    var Router: {module}RouterProtocol {{ get }}
    func onViewDidLoad()   
}}

protocol {module}InteractorOutputProtocol: class {{

}}

protocol {module}RouterProtocol {{
    weak var view: {module}ViewProtocol? {{ get }}
}}

''')

interactor_file = ("{module}/Interactor/{module}Interactor.swift", 

'''
final class {module}Interactor: {module}InteractorProtocol {{
    weak var output: {module}InteractorOutputProtocol?
}}
''')

presenter_file = ("{module}/Presenter/{module}Presenter.swift",

'''
final class {module}Presenter: {module}PresenterProtocol {{
    var interactor: {module}InteractorProtocol
    var Router: {module}RouterProtocol
    weak var view: {module}ViewProtocol?
    
    init(Router: {module}RouterProtocol, interactor: {module}InteractorProtocol) {{
        self.Router = Router
        self.interactor = interactor
    }}
    
    func onViewDidLoad() {{
    
    }}
}}

extension {module}Presenter: {module}InteractorOutputProtocol {{
    
}}

''')

Router_file = ("{module}/Router/{module}Router.swift",
'''
import UIKit
final class {module}Router: {module}RouterProtocol {{
    weak var view: {module}ViewProtocol?
    
    static func createModule() -> UIViewController {{
        let view = {module}View()
        let Router = {module}Router()
        let interactor = {module}Interactor()
        let presenter = {module}Presenter(Router: Router, interactor: interactor)
        Router.view = view
        view.presenter = presenter
        presenter.view = view
        interactor.output = presenter
        return view
    }}
}}
''')

view_file = ("{module}/View/{module}View.swift",
'''

import UIKit

final class {module}View: UIViewController {{
    var presenter: {module}PresenterProtocol?
    
    override func viewDidLoad() {{
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }}
    
}}

extension {module}View: {module}ViewProtocol {{

}}

''')

import os
import argparse

def try_mkdir(path):
    try:
        os.mkdir(path)
    except:
        pass


def generate(module):

    try_mkdir(module)
    try_mkdir(module + "/Protocols")
    try_mkdir(module + "/Presenter")
    try_mkdir(module + "/Interactor")
    try_mkdir(module + "/Router")
    try_mkdir(module + "/View")

    files = [protocols_file, interactor_file, view_file, Router_file, presenter_file]

    for file in files:
        filename = file[0].format(module=module)
        content = file[1].format(module=module)

        f = open(filename, 'w')
        f.write(content)


parser = argparse.ArgumentParser()
parser.add_argument("name", type=str)
args = parser.parse_args()

generate(args.name)
