//
//  ViewController.swift
//  ExampleProject
//
//  Created by Laud Bruce on 09/11/2021.
//

import UIKit
import AppruveiOSSDK

class ViewController: UIViewController {

    @IBOutlet var verificationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapVerificationButton(_ sender: Any) {
        do {
            let appruveViewController = try Appruve.buildVerificationController(delegate: self)
            self.navigationController?.pushViewController(appruveViewController, animated: true)
        } catch {
            print("An error occurred: \(error)")
        }
    }
    
}


extension ViewController: AppruveVerificationCompleteDelegate {
    func onVerificationComplete(result: AppruveVerificationResult) {
        print(result)
    }
    
    func onVerificationFailure(error: String) {
        print(error)
    }
}
