//
//  ViewController.swift
//  DigimeSkeleton
//
//  Created on 19/09/2017.
//  Copyright © 2017 digi.me Ltd. All rights reserved.
//

import UIKit
import DigiMeFramework

class ViewController: UIViewController {

    var loggerController = LogViewController()
    var contractID: String!
    var startDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.title = "digi.me Consent Access"
        initialize()
    }
    
    func initialize() {
        addChildViewController(loggerController)
        self.loggerController.view.frame = view.frame
        self.view.addSubview(loggerController.view)
        self.loggerController.didMove(toParentViewController: self)
        DigiMeFramework.sharedInstance().delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(runTapped))
        self.loggerController.log(toView: "Please press 'Start' to begin requesting data. Also make sure that digi.me app is installed and onboarded.")
        self.navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
        items.append( UIBarButtonItem(title: "➖", style: .plain, target: self, action: #selector(zoomOut))) // replace add with your function
        items.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        items.append( UIBarButtonItem(title: "➕", style: .plain, target: self, action: #selector(zoomIn))) // replace add with your function
        self.toolbarItems = items
    }
    
    @objc func zoomIn () {
        self.loggerController.increaseFontSize()
    }
    @objc func zoomOut () {
        self.loggerController.decreaseFontSize()
    }
    
    @objc private func runTapped() {
        self.startDate = Date()
        self.loggerController.reset()
        self.contractID = staticConstants.kContractId
        self.requestConsentAccessData(p12FileName: staticConstants.kP12KeyStoreFileName, p12Password: staticConstants.kP12KeyStorePassword)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func requestConsentAccessData(p12FileName: String, p12Password: String) {
        let keyHex = SecurityUtilities.getPrivateKeyHex(p12FileName: p12FileName, p12Password: p12Password)
        DigiMeFramework.sharedInstance().digimeFrameworkInitiateDataRequest(withAppID: staticConstants.kAppId,
                                                                         contractID: self.contractID,
                                                                         rsaPrivateKeyHex:keyHex!)
    }
}

extension ViewController: DigiMeFrameworkDelegate {
    
    func digimeFrameworkLog(withMessage message: String) {
        self.loggerController.log(toView: message)
    }
    
    func digimeFrameworkReceiveData(withFileNames fileNames: [String]?, filesWithContent: [AnyHashable : Any]?, error: Error?) {
        
        if(error != nil) {
            self.loggerController.log(toView: String(describing: error))
        } else {
            self.loggerController.log(toView: String(format: "JFS files: %@", fileNames!))
            self.loggerController.log(toView: String(format: "JFS files content: %@", filesWithContent!))
        }
    }
    
    func digimeFrameworkDidChange(_ state: DigiMeFrameworkOperationState) {
        let elapsed = Date().timeIntervalSince(self.startDate)
        self.loggerController.log(toView: String(format: "state: %@ elapsed in %f seconds", String.getDigiMeSDKStateString(state).uppercased(), elapsed))
    }
    
    func digimeFrameworkJsonFilesDownloadProgress(_ progress: Float) {
        self.loggerController.log(toView: String(format: "progress: %.2f%%", progress * 100))
    }
}
