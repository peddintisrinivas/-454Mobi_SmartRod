//
//  WellDetailInfoViewController.swift
//  Smart Rod
//
//  Created by Saraschandra on 06/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class WellDetailInfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CustomeAlertDelegate
{

    @IBOutlet var navigationView: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tableViewBGView: UIView!
    @IBOutlet var detailInfoTableVIew: UITableView!
    @IBOutlet var noRecordsView: UIView!
    var customAlertVC : CustomAlertVC!

    
    let reuseIdentifier = "WellDetailInfoCell"
    
    var titleName = NSString()
    
    var selectedDict : [String : String]!
    
    var selectedIndexPath : Int!
    
    //var wellInfoArrayFromModel =  [WellInfo]()
    
    var contactInfoArray : [ContactInfo] = [ContactInfo]()
    var producingAssestArray : [ProducingAssests] = [ProducingAssests]()
    var serviceCompArray : [ServiceCmpny] = [ServiceCmpny]()
    var designEnggArray : [DesignEngg] = [DesignEngg]()
    var fluidMakeUpArray : [FluidMakeUp] = [FluidMakeUp]()
    var chemTretingArray : [ChemicalTreating] = [ChemicalTreating]()
    var rodStarArray : [RodStar] = [RodStar]()
    var failureAnalysisArray : [FailureAnalysis] = [FailureAnalysis]()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        print("Title Name is : \(titleName)")

        
        titleLabel.text = titleName as String;
        
        tableViewBGView.backgroundColor = UIColor.white
        tableViewBGView.layer.cornerRadius = Constants.tableCornerRadiusValue
        tableViewBGView.layer.masksToBounds = true
        
        tableViewBGView.layer.shadowColor = UIColor.black.cgColor
        tableViewBGView.layer.shadowOpacity = 0.5
        tableViewBGView.layer.shadowOffset = CGSize(width: -1, height: 1)
        tableViewBGView.layer.shadowRadius = 1
        
        tableViewBGView.layer.shadowPath = UIBezierPath(rect: tableViewBGView.bounds).cgPath
        tableViewBGView.layer.shouldRasterize = true
        tableViewBGView.layer.rasterizationScale = UIScreen.main.scale
    
        
        detailInfoTableVIew.isHidden = false
        noRecordsView.isHidden = true
        

        let nib = UINib(nibName: "WellDetailInfoTableViewCell", bundle: nil)
        detailInfoTableVIew.register(nib, forCellReuseIdentifier: reuseIdentifier)
        detailInfoTableVIew.backgroundColor = UIColor.white
        
        detailInfoTableVIew.delegate = self
        detailInfoTableVIew.dataSource = self
        
        detailInfoTableVIew.reloadData()
        
        customAlertVC = CustomAlertVC(nibName: "CustomAlertVC", bundle: nil)

    }

    override func viewDidAppear(_ animated: Bool)
    {
       super.viewDidAppear(false)

       detailInfoTableVIew.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if titleName == "Contact Information"
        {
            return contactInfoArray.count
        }
        else if titleName == "Producing Assets"
        {
            return producingAssestArray.count
        }
        else if titleName == "Service Companies"
        {
            return serviceCompArray.count
        }
        else if titleName == "Design Engineering"
        {
            return designEnggArray.count
        }
        else if titleName == "Fluid Make-Up"
        {
            return fluidMakeUpArray.count
        }
        else if titleName == "Chemicals Treating"
        {
            return chemTretingArray.count
        }
        else if titleName == "Rod Star"
        {
            return rodStarArray.count
        }
        else
        {
            return failureAnalysisArray.count
        }

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: WellDetailInfoTableViewCell = self.detailInfoTableVIew.dequeueReusableCell(withIdentifier: reuseIdentifier) as! WellDetailInfoTableViewCell
                
        if titleName == "Contact Information"
        {
            let contactInfoDetailDict = contactInfoArray[indexPath.row]
            cell.keyLabel.text = contactInfoDetailDict.main
            cell.valueLabel.text = contactInfoDetailDict.name
            
        }
        else if titleName == "Producing Assets"
        {
            let producingAssetsInfoDetailDict = producingAssestArray[indexPath.row]
            cell.keyLabel.text = producingAssetsInfoDetailDict.main
            cell.valueLabel.text = producingAssetsInfoDetailDict.manufacturer
        }
        else if titleName == "Service Companies"
        {
            let serviceInfoDetailDict = serviceCompArray[indexPath.row]
            cell.keyLabel.text = serviceInfoDetailDict.main
            cell.valueLabel.text = serviceInfoDetailDict.msnNumber
        }
        else if titleName == "Design Engineering"
        {
            let designInfoDetailDict = designEnggArray[indexPath.row]
            cell.keyLabel.text = designInfoDetailDict.main
            cell.valueLabel.text = designInfoDetailDict.number
        }
        else if titleName == "Fluid Make-Up"
        {
            let fluidMakeUpInfoDetailDict = fluidMakeUpArray[indexPath.row]
            cell.keyLabel.text = fluidMakeUpInfoDetailDict.main
            cell.valueLabel.text = fluidMakeUpInfoDetailDict.number
        }
        else if titleName == "Chemicals Treating"
        {
            let chemicalInfoDetailDict = chemTretingArray[indexPath.row]
            cell.keyLabel.text = chemicalInfoDetailDict.main
            cell.valueLabel.text = chemicalInfoDetailDict.nameOfChemical
        }
        else if titleName == "Rod Star"
        {
            let rodStarInfoDetailDict = rodStarArray[indexPath.row]
            cell.keyLabel.text = rodStarInfoDetailDict.main
            cell.valueLabel.text = rodStarInfoDetailDict.number
        }
        else
        {
            let failureInfoDetailDict = failureAnalysisArray[indexPath.row]
            cell.keyLabel.text = failureInfoDetailDict.main
            cell.valueLabel.text = failureInfoDetailDict.number
        }
      

        cell.forwardImageView.image = UIImage(named : "move")
        
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    
        selectedIndexPath = indexPath.row
        
        let childView = customAlertVC.view
        childView?.frame =  CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.addChildViewController(customAlertVC)
        customAlertVC.didMove(toParentViewController: self)
        customAlertVC.delegate = self
        self.view.addSubview(childView!)
        
    }
    func customAlert_No_BtnTapped()
    {
        
        self.customAlertVC.view.removeFromSuperview()

    }
    func customAlert_Yes_BtnTapped()
    {
        
        self.customAlertVC.view.removeFromSuperview()
        
        if titleName == "Contact Information"
        {
            let contactsViewController : ContactsViewController = ContactsViewController(nibName:NibNamed.ContactsViewController.rawValue, bundle:nil)
            
            contactsViewController.titleName = titleName
            
            let contactInfoSelectedDict = contactInfoArray[selectedIndexPath]
            contactsViewController.contactInfo = contactInfoSelectedDict
            
            
            self.navigationController!.pushViewController(contactsViewController, animated: true)
        }
        else if titleName == "Producing Assets"
        {
            let producingViewController : ProducingViewController = ProducingViewController(nibName:NibNamed.ProducingViewController.rawValue, bundle:nil)
            
            producingViewController.titleName = titleName
            
            let producingAssestInfoSelectedDict = producingAssestArray[selectedIndexPath]
            producingViewController.producingAssestsInfo = producingAssestInfoSelectedDict
            
            self.navigationController!.pushViewController(producingViewController, animated: true)
        }
        else if titleName == "Service Companies"
        {
            let serviceViewController : ServiceViewController = ServiceViewController(nibName:NibNamed.ServiceViewController.rawValue, bundle:nil)
            
            serviceViewController.titleName = titleName
            
            let serviceInfoSelectedDict = serviceCompArray[selectedIndexPath]
            serviceViewController.serviceInfo = serviceInfoSelectedDict
            
            self.navigationController!.pushViewController(serviceViewController, animated: true)
        }
        else if titleName == "Design Engineering"
        {
            let designViewController : DesignViewController = DesignViewController(nibName:NibNamed.DesignViewController.rawValue, bundle:nil)
            
            designViewController.titleName = titleName
            
            let designInfoSelectedDict = designEnggArray[selectedIndexPath]
            designViewController.designInfo = designInfoSelectedDict
            
            self.navigationController!.pushViewController(designViewController, animated: true)
        }
        else if titleName == "Fluid Make-Up"
        {
            let fluidViewController : FluidViewController = FluidViewController(nibName:NibNamed.FluidViewController.rawValue, bundle:nil)
            
            fluidViewController.titleName = titleName
            
            let fluidMakeUpInfoSelectedDict = fluidMakeUpArray[selectedIndexPath]
            fluidViewController.fluidMakeUpInfo = fluidMakeUpInfoSelectedDict
            
            self.navigationController!.pushViewController(fluidViewController, animated: true)
        }
        else if titleName == "Chemicals Treating"
        {
            let chemicalsViewController : ChemicalsViewController = ChemicalsViewController(nibName:NibNamed.ChemicalsViewController.rawValue, bundle:nil)
            
            chemicalsViewController.titleName = titleName
            
            let chemicalInfoSelectedDict = chemTretingArray[selectedIndexPath]
            chemicalsViewController.chemicalsInfo = chemicalInfoSelectedDict
            
            self.navigationController!.pushViewController(chemicalsViewController, animated: true)
        }
        else if titleName == "Rod Star"
        {
            let rodStarViewController : RodStarViewController = RodStarViewController(nibName:NibNamed.RodStarViewController.rawValue, bundle:nil)
            
            rodStarViewController.titleName = titleName
            let rodStarInfoSelectedDict = rodStarArray[selectedIndexPath]
            rodStarViewController.rodStarInfo = rodStarInfoSelectedDict
            
            self.navigationController!.pushViewController(rodStarViewController, animated: true)
        }
        else if titleName == "Failure Analysis & Resolution"
        {
            let failureViewController : FailureViewController = FailureViewController(nibName:NibNamed.FailureViewController.rawValue, bundle:nil)
            
            failureViewController.titleName = titleName
            let failureInfoSelectedDict = failureAnalysisArray[selectedIndexPath]
            failureViewController.failureInfo = failureInfoSelectedDict
            
            self.navigationController!.pushViewController(failureViewController, animated: true)
        }

    }
    func customAlert_Cross_BtnTapped()
    {
        
        self.customAlertVC.view.removeFromSuperview()

    }
    
    @IBAction func backBtnAction(_ sender: Any)
    {
         _ = navigationController?.popViewController(animated: true)
    }
  
}
