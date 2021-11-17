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
        
        let navigationBar = self.navigationController!.navigationBar
        navigationItem.title = "Verify your identity"
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .blue
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBar.standardAppearance = appearance;
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        } else {
            // Fallback on earlier versions
            navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBar.barTintColor = .blue
        }
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


extension ViewController: AppruveVerificationDelegate {
    func onFlowChanged(flow: String) {
        print(flow)
    }
    
    func onVerificationComplete(result: AppruveVerificationResult) {
        print(result)
    }
    
    func onVerificationFailure(error: String) {
        print(error)
    }
}
