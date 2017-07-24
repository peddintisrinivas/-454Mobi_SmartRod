//
//  WellIdfViewController.swift
//  Smart Rod
//
//  Created by Saraschandra on 04/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class WellIdfViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate
{

    @IBOutlet var navigationView: UIView!
    
    @IBOutlet var backButton: UIButton!
    
    @IBOutlet var navigationLabel: UILabel!
    
    
    @IBOutlet weak var emailError_Lble : UILabel!
    
    @IBOutlet var textFieldBGView: UIView!
    @IBOutlet var textFieldsBGViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var wellListTxtFld: UITextField!
    
    @IBOutlet var wellListTableView: UITableView!
    @IBOutlet var wellListTableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var wellInfo_TF : UITextField!
    @IBOutlet var wellInfo_TF_T_Constraint: NSLayoutConstraint!
    @IBOutlet var wellInfo_TF_H_Constraint: NSLayoutConstraint!
    
    @IBOutlet var wellInfoTableView: UITableView!
    @IBOutlet var wellInfoTableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var continueBtnTopCostriant: NSLayoutConstraint!
    
    
    var actualTextFieldsBGViewHeight : CGFloat!
    var actualcontinueBtnTopCostriant : CGFloat!
    
    let cellReuseIdentifier = "cell"
    
    
    var fadeOutTimer : Timer? = nil
    var doneToolbar = UIToolbar()
    var lastSelectedIndexPathForWellList : NSIndexPath!
    
    let checkMarkColor : UIColor = UIColor(red: 255/255, green: 191/255, blue: 41/255, alpha: 1)
    
    var wellInfoArray  = [[String : Any]]()
    
    var secondTextFeildArray : [String]? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let landOwnerNamesArray = ["Mr. Jhon","Mr. Smith","Mr. Clerk"]
        let producerNamesArray = ["Mr. Cook","Mr. Mac","Mr. Jack"]
        let wellNamesArray = ["USA Bagley","USA State Bagley","State Bagley"]
        let gpsNamesArray = ["41°24'12.2 N 2°10'26.5 E","54°04'62.2 N 6°10'46.5 E","51°29'12.8 N 2°11'68.4 E"]
        let fieldNamesArray = ["North Sea Oil","Permain Basin","Snorre Oil Field"]
        let railRoadNamesArray = ["(877) 228-5740","(512) 463-7158 ","(800) 735-2989"]
        let afeAssociateNamesArray = ["(877) 228-5740","(512) 463-7158 ","(800) 735-2989"]
        
        let landOwnerDict : [String : Any] = ["Main" : "Landowner / Leasor","NamesArray" : landOwnerNamesArray]
        let producerDict : [String : Any] = ["Main" : "Name of Producer","NamesArray" : producerNamesArray]
        let wellNameDict : [String : Any] = ["Main" : "Well Name","NamesArray" : wellNamesArray]
        let gpsDict : [String : Any] = ["Main" : "GPS Coordinates","NamesArray" : gpsNamesArray]
        let fieldArray : [String : Any] = ["Main" :"Field Name","NamesArray" : fieldNamesArray]
        let railRoadArray : [String : Any] = ["Main" :"Railroa Commission Number","NamesArray" : railRoadNamesArray]
        let afeAssociateArray : [String : Any] = ["Main" : "AFE Associated Number","NamesArray" : afeAssociateNamesArray]
        
        wellInfoArray = [landOwnerDict,producerDict,wellNameDict,gpsDict,fieldArray,railRoadArray,afeAssociateArray]


        actualTextFieldsBGViewHeight = textFieldsBGViewHeightConstraint.constant
        actualcontinueBtnTopCostriant = continueBtnTopCostriant.constant
        
        self.emailError_Lble.alpha = 0

        wellListTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        wellListTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: PlaceHolderText.kWellPlaceHolder)
        wellListTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        wellListTxtFld.setRightIcon(UIImage(named: "drop_down")!, imageWidth:19 , imageHegith: 11)
        wellListTxtFld.inputView = wellListTableView;
        
        wellListTableView.layer.cornerRadius = 10.0
        wellListTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
       
        
        self.wellInfo_TF_H_Constraint.constant = 0
        self.view.layoutIfNeeded()
        
        wellInfo_TF.layer.cornerRadius = Constants.cornerRadiusValue
        self.wellInfo_TF.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        wellInfo_TF.setRightIcon(UIImage(named: "drop_down")!, imageWidth:19 , imageHegith: 11)
        wellInfo_TF.inputView = wellInfoTableView;
        wellInfo_TF.autocorrectionType = .no
        
        wellInfoTableView.layer.cornerRadius = 10.0
        wellInfoTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        continueButton.layer.cornerRadius = Constants.cornerRadiusValue
        
      
    }
    
       
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        
        if(textField == wellListTxtFld)
        {
            if self.wellInfoTableViewHeightConstraint.constant > 0
            {
                self.view.endEditing(true)
                
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.textFieldsBGViewHeightConstraint.constant = self.actualTextFieldsBGViewHeight
                    self.wellInfoTableViewHeightConstraint.constant = 0
                    self.continueBtnTopCostriant.constant = self.actualcontinueBtnTopCostriant
                    self.view.layoutIfNeeded()
                    
                    self.wellListTableViewExpand()
                    
                    })
            }
            else
            {
                self.wellListTableViewExpand()
            }
        }
        else if(textField == wellInfo_TF)
        {
            self.wellInfoTableViewExpand()
        }
    }
    
    func wellListTableViewExpand()
    {
    
        wellListTableView.delegate = self
        wellListTableView.dataSource = self
        wellListTableView.reloadData()
            
        self.view.endEditing(true)
            
        UIView.animate(withDuration: 0.5, animations: {
                
            self.wellInfo_TF_H_Constraint.constant = 0
            self.view.layoutIfNeeded()
            })
            { (finished) in
                
                UIView.animate(withDuration: 0.5, animations: {
                    
                self.textFieldsBGViewHeightConstraint.constant = (self.actualTextFieldsBGViewHeight + 150) - 34
                self.wellListTableViewHeightConstraint.constant = 150
                self.continueBtnTopCostriant.constant = (self.actualcontinueBtnTopCostriant + 155) - 34
                self.view.layoutIfNeeded()
                    
                })
            }
    }
    
    func wellInfoTableViewExpand()
    {
        wellInfoTableView.delegate = self
        wellInfoTableView.dataSource = self
        wellInfoTableView.reloadData()
        
        self.view.endEditing(true)
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.textFieldsBGViewHeightConstraint.constant = (self.actualTextFieldsBGViewHeight + 100) - 34
            self.wellInfoTableViewHeightConstraint.constant = 100
            self.continueBtnTopCostriant.constant = self.wellInfoTableViewHeightConstraint.constant + 6
            self.view.layoutIfNeeded()
            
        })

    }

    @IBAction func backBtnAction(_ sender: Any)
    {
        _ = self.navigationController?.popViewController(animated: true)

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.wellInfo_TF.resignFirstResponder()

        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == wellListTableView
        {
            return wellInfoArray.count
        }
        else
        {
            return secondTextFeildArray!.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == wellListTableView
        {
            let cell:UITableViewCell = self.wellListTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
            
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont(name: "ROBOTO-Light", size:12);
            
            let wellInfoDict = wellInfoArray[indexPath.row]
            cell.textLabel?.text = wellInfoDict["Main"] as! String?
            
            
            cell.tintColor = checkMarkColor
            
            cell.accessoryType = (lastSelectedIndexPathForWellList?.row == indexPath.row) ? .checkmark : .none
            return cell;

        }
        else
        {
            let cell:UITableViewCell = self.wellInfoTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
            
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont(name: "ROBOTO-Light", size:12);
            
            cell.textLabel?.text = secondTextFeildArray?[indexPath.row]
            
            return cell

        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == wellListTableView
        {
            let wellInfoDict = wellInfoArray[indexPath.row]
            wellListTxtFld.text = wellInfoDict["Main"] as? String
            secondTextFeildArray = wellInfoDict["NamesArray"] as? [String]
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.textFieldsBGViewHeightConstraint.constant = self.actualTextFieldsBGViewHeight
                self.wellListTableViewHeightConstraint.constant = 0
                self.continueBtnTopCostriant.constant = self.actualcontinueBtnTopCostriant
                self.wellInfo_TF.attributedPlaceholder = Constants.wellInfoPalceHolderColor(placeHolderText: String(format:"Enter %@",self.wellListTxtFld.text!))
                self.wellInfo_TF.text = ""
                self.view.layoutIfNeeded()
                
            }) { (finished) in
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.wellInfo_TF_H_Constraint.constant = 45
                    self.view.layoutIfNeeded()
                })
                
            }
            
            if indexPath.row != self.lastSelectedIndexPathForWellList?.row
            {
                if let lastSelectedIndexPath = self.lastSelectedIndexPathForWellList
                {
                    let oldCell = tableView.cellForRow(at: lastSelectedIndexPath as IndexPath)
                    oldCell?.accessoryType = .none
                }
                
                let newCell = tableView.cellForRow(at: indexPath)
                newCell?.accessoryType = .checkmark
                
                self.lastSelectedIndexPathForWellList = indexPath as NSIndexPath!
                
            }


        }
        else
        {
            wellInfo_TF.text = secondTextFeildArray?[indexPath.row]
            
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.textFieldsBGViewHeightConstraint.constant = self.actualTextFieldsBGViewHeight
                self.wellInfoTableViewHeightConstraint.constant = 0
                self.continueBtnTopCostriant.constant = self.actualcontinueBtnTopCostriant
                self.view.layoutIfNeeded()
            })
            

        }
        
        
    }
    
    func displayErrorMessage()
    {
        
        UIView.animate(withDuration: 0.5) { 
            self.emailError_Lble.text = String(format:"Select %@",self.wellListTxtFld.text!)
            self.emailError_Lble.alpha = 1
            self.startFadeOutTimer()

        }
 
    }
    
    @IBAction func continueBtnAction(_ sender: Any)
    {
        if(self.wellInfo_TF.text?.isEmpty)!
        {
            self.displayErrorMessage()
        }
        
        else
        {
            
            let wellInfoController : UIViewController = WellInfoViewController(nibName:NibNamed.WellInfoViewController.rawValue, bundle:nil)
            self.navigationController!.pushViewController(wellInfoController, animated: true)
        }
    }

    func startFadeOutTimer()
    {
        self.invalidateFadeOutTimer()
        
        self.fadeOutTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(fadeOutTimerEnded), userInfo: nil, repeats: false)
    }
    
    func invalidateFadeOutTimer()
    {
        if self.fadeOutTimer != nil
        {
            self.fadeOutTimer?.invalidate()
            
        }
    }

    func fadeOutTimerEnded()
    {
        UIView.animate(withDuration: 0.5, animations:
            {
                self.emailError_Lble.alpha = 0
                
            })
    }
    
}
