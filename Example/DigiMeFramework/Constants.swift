//
//  Constants.swift
//  DigimeSkeleton
//
//  Created on 19/09/2017.
//  Copyright © 2017 digi.me Ltd. All rights reserved.
//

struct staticConstants {
    static let kAppId               = "your_real_app_id"        // <- sample: "gDdQfubl66rj07webI92m4afPL9va9Z1" (32 characters hex string given by digi.me support)
    static let kContractId          = "your_real_contract_id"   // <- sample: "QX5ZRGNsD6dhfkF4rkjhsdfkula97Hqr" (32 characters hex string given by digi.me support)
    
    // add your CA_RSA_PRIVATE_KEY.p12 file to the project
    // check if p12 file is available under 'Targets' > 'Build Phases' > 'Copy Bundle Resources'
    static let kP12KeyStoreFileName = "your_real_p12_file_name" // <- sample: "CA_RSA_PRIVATE_KEY" (filename without the extension .p12)
    static let kP12KeyStorePassword = "your_real_key_password"  // <- sample: "20ov;p-1Fi3oL" (the password that goes with your private key)
}

