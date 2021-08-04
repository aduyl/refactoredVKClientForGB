//
//  ViewController.swift
//  refactoredVKclient
//
//  Created by mac on 10.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var enteredPassord: UITextField!
    @IBOutlet weak var enteredUsername: UITextField!
    @IBOutlet weak var loginScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func showAlert(alertText: String) {
        let alertController = UIAlertController(title: "Error", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func pushLoginBotton(_ sender: Any) {
        let tabbarController = TabBarController()
        navigationController?.pushViewController(tabbarController, animated: true)
    }

}

