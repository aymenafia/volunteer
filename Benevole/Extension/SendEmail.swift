//
//  SendEmail.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 11/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
extension DescViewController {
    
 
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
