//
//  CustomAlertVC.swift
//  Smart Rod
//
//  Created by Srinivas Peddinti on 7/7/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

protocol CustomeAlertDelegate
{
    func customAlert_Yes_BtnTapped()
    func customAlert_No_BtnTapped()
    func customAlert_Cross_BtnTapped()
    
    
}
class CustomAlertVC: UIViewController {

    var delegate : CustomeAlertDelegate!

    @IBOutlet weak var yesBtn : UIButton!
    @IBOutlet weak var noBtn : UIButton!

    @IBOutlet weak var backGrndView : UIView!
    @IBOutlet weak var recordView : UIView!
    @IBOutlet weak var buttonBackView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        backGrndView.layer.masksToBounds = true
        backGrndView.layer.cornerRadius = Constants.tableCornerRadiusValue
        backGrndView.layer.borderWidth = 1.0
        backGrndView.layer.borderColor = UIColor.black.cgColor
        
        recordView.layer.masksToBounds = true
        recordView.layer.cornerRadius = Constants.tableCornerRadiusValue

        buttonBackView.layer.cornerRadius = Constants.tableCornerRadiusValue
        buttonBackView.layer.masksToBounds = true

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesButtonTapped()
    {
        self.delegate.customAlert_Yes_BtnTapped()
    }
    @IBAction func noButtonTapped()
    {
        self.delegate.customAlert_No_BtnTapped()
    }
    @IBAction func crossButtonTapped()
    {
        self.delegate.customAlert_Cross_BtnTapped()
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
