//
//  CreateViewController.swift
//  SESTest08
//
//  Created by Tamas Szuhanszky on 2018. 02. 19..
//  Copyright © 2018. SAP. All rights reserved.
//

import UIKit
import Foundation
import SAPFoundation
import SAPOData
import SAPOfflineOData
import SAPFiori
import SAPCommon

class CreateViewController: UIViewController, SAPFioriLoadingIndicator {
    var loadingIndicator: FUILoadingIndicatorView?
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var ymsesapprovalsrvEntities: YMSESAPPROVALSRVEntities<OnlineODataProvider> {
        return self.appDelegate.ymsesapprovalsrvEntitiesOnline
    }
    
    private var entity: YmSesIosCreate = YmSesIosCreate()
    
    @IBOutlet weak var txt_ponum: UITextField!
    @IBOutlet weak var txt_poitem: UITextField!
    @IBOutlet weak var txt_shorttext: UITextField!
    @IBOutlet weak var txt_userint: UITextField!
    @IBOutlet weak var txt_comment: UITextView!
    
    
    @IBAction func createEvent(_ sender: Any) {
        if txt_ponum.text != "" && txt_poitem.text != "" && txt_shorttext.text != "" {
            self.entity.poNumber = txt_ponum.text
            self.entity.poItem = txt_poitem.text
            self.entity.note = txt_comment.text
            self.entity.shortText = txt_shorttext.text
            self.entity.personInt = txt_userint.text
            
            self.showFioriLoadingIndicator()
            self.view.endEditing(true)
            self.ymsesapprovalsrvEntities.createEntity(self.entity) { error in  //pushing updated flag into the DB
                self.hideFioriLoadingIndicator()
                if let error = error {
                    let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
                    OperationQueue.main.addOperation({
                        self.present(alertController, animated: true)
                    })
                    return
                }
        }
    }
    
    func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }
}
