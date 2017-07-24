//
//  WellInfoViewController.swift
//  Smart Rod
//
//  Created by Saraschandra on 05/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class WellInfoViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    let firstCellColor : UIColor = UIColor(red: 93/255, green: 93/255, blue: 65/255, alpha: 1)
    let secondCellColor : UIColor = UIColor(red: 42/255, green: 57/255, blue: 95/255, alpha: 1)
    let thirdCellColor : UIColor = UIColor(red: 48/255, green: 92/255, blue: 84/255, alpha: 1)
    let fourthCellColor : UIColor = UIColor(red: 44/255, green: 66/255, blue: 96/255, alpha: 1)
    let fifthCellColor : UIColor = UIColor(red: 87/255, green: 118/255, blue: 107/255, alpha: 1)
    let sixthCellColor : UIColor = UIColor(red: 66/255, green: 77/255, blue: 121/255, alpha: 1)
    let seventhCellColor : UIColor = UIColor(red: 67/255, green: 67/255, blue: 88/255, alpha: 1)
    let eightCellColor : UIColor = UIColor(red: 57/255, green: 115/255, blue: 104/255, alpha: 1)
    
    let firstCellBorderColor = UIColor(red: 169/255, green: 70/255, blue: 70/255, alpha: 1).cgColor
    let secondCellBorderColor  = UIColor(red: 93/255, green: 94/255, blue: 171/255, alpha: 1).cgColor
    let thirdCellBorderColor  = UIColor(red: 23/255, green: 125/255, blue: 91/255, alpha: 1).cgColor
    let fourthCellBorderColor  = UIColor(red: 41/255, green: 112/255, blue: 155/255, alpha: 1).cgColor
    let fifthCellBorderColor  = UIColor(red: 100/255, green: 158/255, blue: 65/255, alpha: 1).cgColor
    let sixthCellBorderColor  = UIColor(red: 128/255, green: 62/255, blue: 113/255, alpha: 1).cgColor
    let seventhCellBorderColor  = UIColor(red: 110/255, green: 93/255, blue: 54/255, alpha: 1).cgColor
    let eightCellBorderColor  = UIColor(red: 56/255, green: 144/255, blue: 119/255, alpha: 1).cgColor
    
    let reuseIdentifier = "WellInfoCell"
    
    @IBOutlet var navigationView: UIView!
    
    @IBOutlet var backButton: UIButton!
    
    @IBOutlet var wellInfoCollectionView: UICollectionView!
    
    var wellInfoArray : NSArray!
    
    var wellInfoArrayFromModel =  [WellInfo]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "WellInfoCollectionViewCell", bundle: nil)
        self.wellInfoCollectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)

        wellInfoCollectionView.delegate = self
        wellInfoCollectionView.dataSource = self
        
        //First cell details
        
        let superintendentDetailDict = ["Main" : "Superintendent", "Name" : "Mr. Warner", "Cell" : "9676252140","Office" : "Tech","Fax" : "5646-83568","Email" : "warner.w@gmail.com"]
        
        let enginnerDetailDict = ["Main" : "Engineer(s)", "Name" : "Mr. Starc", "Cell" : "9676252141","Office" : "Mobi-Fax","Fax" : "5646-83568","Email" : "starc.s@gmail.com"]
        
        let productionForemanDetailDict = ["Main" : "Production Foreman", "Name" : "Mr. Lyon", "Cell" : "9676252142","Office" : "Innov-Solutions","Fax" : "5646-83568","Email" : "lyon.l@gmail.com"]
        
        let pumperDetailDict = ["Main" : "Pumper", "Name" : "Mr. Watson", "Cell" : "9676252143","Office" : "Dellex","Fax" : "5646-83569","Email" : "watson.y@gmail.com"]
        
        let administrationAssistantDetailDict = ["Main" : "Administration Assistant", "Name" : "Mr. Yogi", "Cell" : "9676252144","Office" : "App-care","Fax" : "5646-83568","Email" : "Yogi.y@gmail.com"]
        
        let accountPayableDetailDict = ["Main" : "Accounts Payable", "Name" : "Mr. Marsh", "Cell" : "9676252145","Office" : "WellsFergo","Fax" : "5646-83568","Email" : "marsh.m@gmail.com"]
        
        let safetyManagerDetailDict  = ["Main" : "Safety Manager", "Name" : "Mr. Roy", "Cell" : "9676252146","Office" : "Major global it","Fax" : "5646-83568","Email" : "roy.r@gmail.com"]
        
        let emergencyContactDetailDict = ["Main" : "Emergency Contact", "Name" : "Mr. Kasim", "Cell" : "9676252147","Office" : "Hire-Sol","Fax" : "5646-83568","Email" : "kasim.k@gmail.com"]
        
        
        let firstCellDetailedArray = [superintendentDetailDict,enginnerDetailDict,productionForemanDetailDict,pumperDetailDict,administrationAssistantDetailDict,accountPayableDetailDict,safetyManagerDetailDict,emergencyContactDetailDict]
        
        let firstCellDict = ["Background Color" : firstCellColor, "Border Color" : firstCellBorderColor, "Image" : "contact", "Name" : "Contact Information","DetailInfo" : firstCellDetailedArray] as [String : Any]
        
        
        //Second cell details
        
        let pumpJackDetailDict = ["Main" : "Pump Jack","Manufacturer" : "JCPump", "Serial Number" : "2251555","Sizing" : "5.6","Asset Count" : "20","Date installed" : "5-2-2017","Service Company Of Installation" : "Basic", "Data Sheets" : "Available" , "Inspection Reports" : "Good"]
        
        let casingDetailDict = ["Main" : "Casing","Manufacturer" : "Nitta Casings Inc.", "Serial Number" : "5684965","Sizing" : "4.5","Asset Count" : "40","Date installed" : "2-5-2016","Service Company Of Installation" : "High", "Data Sheets" : "Not Available" , "Inspection Reports" : "Excellent"]
        
        let tubingDetailDict = ["Main" : "Tubing","Manufacturer" : "Plymouth Tube Co", "Serial Number" : "2251555","Sizing" : "5.6","Asset Count" : "20","Date installed" : "5-2-2017","Service Company Of Installation" : "Basic", "Data Sheets" : "Available" , "Inspection Reports" : "Good"]
        
        let steelSuckerRodsDetailDict = ["Main" : "Steel Sucker Rods","Manufacturer" : "Steel Sucker Industrial Co.",  "Serial Number" : "5684965","Sizing" : "4.5","Asset Count" : "40","Date installed" : "2-5-2016","Service Company Of Installation" : "High", "Data Sheets" : "Not Available" , "Inspection Reports" : "Excellent"]
        
        let fiberglassSuckerRodsDetailDict = ["Main" : "Fiberglass Sucker Rods","Manufacturer" : "Max-Gain Systems Inc", "Serial Number" : "2251555","Sizing" : "5.6","Asset Count" : "20","Date installed" : "5-2-2017","Service Company Of Installation" : "Basic", "Data Sheets" : "Available" , "Inspection Reports" : "Good"]
        
        let rothPumpDetailDict = ["Main" : "Pumps","Manufacturer" : "Roth Pump", "Serial Number" : "5684965","Sizing" : "4.5","Asset Count" : "40","Date installed" : "2-5-2016","Service Company Of Installation" : "High", "Data Sheets" : "Not Available" , "Inspection Reports" : "Excellent"]
        
        let chemicalsDetailDict = ["Main" : "Chemicals","Manufacturer" : "BASF", "Serial Number" : "2251555","Sizing" : "5.6","Asset Count" : "20","Date installed" : "5-2-2017","Service Company Of Installation" : "Basic", "Data Sheets" : "Available" , "Inspection Reports" : "Good"]
        
        let tubingAnchorDetailDict = ["Main" : "Tubing Anchor","Manufacturer" : "SYI Industrial Co., Ltd.",  "Serial Number" : "5684965","Sizing" : "4.5","Asset Count" : "40","Date installed" : "2-5-2016","Service Company Of Installation" : "High", "Data Sheets" : "Not Available" , "Inspection Reports" : "Excellent"]
        
        let pumpoffControllerDetailDict = ["Main" : "Pump-off Controller","Manufacturer" : "Ajinkya Electroic Systems", "Serial Number" : "2251555","Sizing" : "5.6","Asset Count" : "20","Date installed" : "5-2-2017","Service Company Of Installation" : "Basic", "Data Sheets" : "Available" , "Inspection Reports" : "Good"]
        
        let wellheadDetailDict = ["Main" : "Wellhead","Manufacturer" : "PangTong Wellhead USA Inc.",  "Serial Number" : "5684965","Sizing" : "4.5","Asset Count" : "40","Date installed" : "2-5-2016","Service Company Of Installation" : "High", "Data Sheets" : "Not Available" , "Inspection Reports" : "Excellent"]
        
        let wellheadAssemblyDetailDict = ["Main" : "Wellhead Assembly","Manufacturer" : "Kingsa Industries Wellhead","Serial Number" : "2251555","Sizing" : "5.6","Asset Count" : "20","Date installed" : "5-2-2017","Service Company Of Installation" : "Basic", "Data Sheets" : "Available" , "Inspection Reports" : "Good"]
        
        let flowlineDetailDict = ["Main" : "Flowline","Manufacturer" : "ezeFlow Group",  "Serial Number" : "5684965","Sizing" : "4.5","Asset Count" : "40","Date installed" : "2-5-2016","Service Company Of Installation" : "High", "Data Sheets" : "Not Available" , "Inspection Reports" : "Excellent"]
        
        let panelBoxDetailDict = ["Main" : "Panel Box","Manufacturer" : "American Panel Corporation", "Serial Number" : "2251555","Sizing" : "5.6","Asset Count" : "20","Date installed" : "5-2-2017","Service Company Of Installation" : "Basic", "Data Sheets" : "Available" , "Inspection Reports" : "Good"]
        
        let electricTransformersDetailDict = ["Main" : "Electric Transformers","Manufacturer" : "C G Power Solutions USA", "Serial Number" : "5684965","Sizing" : "4.5","Asset Count" : "40","Date installed" : "2-5-2016","Service Company Of Installation" : "High", "Data Sheets" : "Not Available" , "Inspection Reports" : "Excellent"]
        
        let secondCellDetailedArray = [pumpJackDetailDict,casingDetailDict,tubingDetailDict,steelSuckerRodsDetailDict,fiberglassSuckerRodsDetailDict,rothPumpDetailDict,chemicalsDetailDict,tubingAnchorDetailDict,pumpoffControllerDetailDict,wellheadDetailDict,wellheadAssemblyDetailDict,flowlineDetailDict,panelBoxDetailDict,electricTransformersDetailDict]

        let secondCellDict = ["Background Color" : secondCellColor, "Border Color" : secondCellBorderColor, "Image" : "producing", "Name" : "Producing Assets","DetailInfo" : secondCellDetailedArray] as [String : Any]
        
        
        
        //Third cell details
        
        let roustaboutCompanyDetailDict = ["Main" : "Roustabout Company","MSNNumber" : "040 4015 9021", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let electricianDetailDict = ["Main" : "Electrician","MSNNumber" : "040 4015 9022", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let fluidServicesChemicalDetailDict = ["Main" : "Fluid Services(Chemicals)","MSNNumber" : "040 4015 9023", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let fluidServicesTransportDetailDict = ["Main" : "Fluid Services(Transport)","MSNNumber" : "040 4015 9024","Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let hotOilerDetailDict = ["Main" : "Hot Oiler (Transport)","MSNNumber" : "040 4015 9025", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let workoverDetailDict = ["Main" : "Workover / Pulling Unit","MSNNumber" : "040 4015 9026", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let pumpTrunkDetailDict = ["Main" : "Kill Truck / Pump Truck","MSNNumber" : "040 4015 9027","Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let hotShotDetailDict = ["Main" : "Hot Shot","MSNNumber" : "040 4015 9028","Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let inspectionTubingDetailDict = ["Main" : "Inspection Services(Tubing)","MSNNumber" : "040 4015 9029", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let inspectionServicesDetailDict = ["Main" : "Inspection Services(Rods)","MSNNumber" : "040 4015 9010","Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let pumpsDetailDict = ["Main" : "Pumps","MSNNumber" : "040 4015 9011","Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let crudeOilDetailDict = ["Main" : "Gatherer for Crude Oil & Condensate","MSNNumber" : "040 4015 9012","Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let contractPumperDetailDict = ["Main" : "Contract Pumper","MSNNumber" : "040 4015 9013", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let flowbackDetailDict = ["Main" : "Completion / Flowback Company","MSNNumber" : "040 4015 9014","Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let tankrentalsDetailDict = ["Main" : "Tank Rentals","MSNNumber" : "040 4015 9015", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let constructionLocationDetailDict = ["Main" : "Construction for Location","MSNNumber" : "040 4015 9016", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let wellAnalystTechDetailDict = ["Main" : "Well Analyst Tech","MSNNumber" : "040 4015 9017", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let wirelineDetailDict = ["Main" : "Wireline","MSNNumber" : "040 4015 9018","Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let automationDetailDict = ["Main" : "Automation","MSNNumber" : "040 4015 9019", "Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let communicationsDetailDict = ["Main" : "Communications","MSNNumber" : "040 4015 9020","Functionality" : "Working","Executive Man" : "Kranthi","Contact Number" : "9656252456","Email" : "kranthi.k@gmail.com","Company Representative" : "Available", "AR/AP Name" : "RAM" , "Company Address" : "California"]
        
        let thirdCellDetailedArray = [roustaboutCompanyDetailDict,electricianDetailDict, fluidServicesChemicalDetailDict,fluidServicesTransportDetailDict,hotOilerDetailDict, workoverDetailDict,pumpTrunkDetailDict,hotShotDetailDict,inspectionTubingDetailDict,inspectionServicesDetailDict,pumpsDetailDict,crudeOilDetailDict, contractPumperDetailDict,flowbackDetailDict,tankrentalsDetailDict,constructionLocationDetailDict, wellAnalystTechDetailDict,wirelineDetailDict,automationDetailDict,communicationsDetailDict]

        let thirdCellDict = ["Background Color" : thirdCellColor, "Border Color" : thirdCellBorderColor, "Image" : "service", "Name" : "Service Companies","DetailInfo" : thirdCellDetailedArray] as [String : Any]
        
        
        
        
        //Fourth Cell Details
        
        let snDepthDetailDict = ["Main" : "Seatnipple Depth(SNDepth)","Number" : "20", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let harmonicsNumberDetailDict = ["Main" : "Harmonics Number","Number" : "500 harms", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let surfaceStrokeDetailDict = ["Main" : "Surface Stroke","Number" : "1.0625 to 3.75 in.", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let downholeStrokeDetailDict = ["Main" : "Downhole Stroke","Number" : "1.9- to 4.5-in. OD", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let strokeLenPerPumpingUnitDetailDict = ["Main" : "Stroke Length per Pumping Unit","Number" : "16 - 192", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let strokePerMinForPumpingUnitDetailDict = ["Main" : "Stroke per Minute for Pumping Unit","Number" : "16 in", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let nanoDetailDict = ["Main" : "NA / NO","Number" : "40","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let skrDetailDict = ["Main" : "FÆ / Skr","Number" : "20","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let fluidLevelDetailDict = ["Main" : "Fluid Level","Number" : "20", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let flapDetailDict = ["Main" : "Fluid Level Above Pump (FLAP)","Number" : "2.24", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let ffsDetailDict = ["Main" : "Feet From Surface (FFS)","Number" : "2.569", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let tpDetailDict = ["Main" : "Tubing Pressure","Number" : "15 ml", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let cpDetailDict = ["Main" : "Casing Pressure","Number" : "50 ml", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let mhDetailDict = ["Main" : "Motor Horsepower","Number" : "33,000 ft-lbf/min", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let pusDetailDict = ["Main" : "Pumping Unit Size","Number" : "40","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let tsDetailDict = ["Main" : "Tubing Size","Number" : "100","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let tatDetailDict = ["Main" : "Tubing Anchor - lbs of tension","Number" : "200","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let psrpDetailDict = ["Main" : "Pump Size for Rod Pump","Number" : "50","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let rcssrDetailDict = ["Main" : "Rod Count - Steel Sucker Rods","Number" : "655","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let rcfsrDetailDict = ["Main" : "Rod Count - Fiberglass Sucker Rods","Number" : "40","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let sbDetailDict = ["Main" : "Sinker Bars","Number" : "20","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let mftDetailDict = ["Main" : "MTR's for Tubing","Number" : "50", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let rsiDetailDict = ["Main" : "Rod Star Inputs","Number" : "5", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let wvDetailDict = ["Main" : "Wellview","Number" : "8", "Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let drDetailDict = ["Main" : "Deviation Reports","Number" : "651","Description" : "it's max value","Subject Matter Expert" : "Available","Contact Number" : "9905853334","Email" : "rk@gmail.com","Company Engineer" : "RK"]
        
        let fourthCellDetailedArray = [snDepthDetailDict, harmonicsNumberDetailDict, surfaceStrokeDetailDict, downholeStrokeDetailDict,strokeLenPerPumpingUnitDetailDict, strokePerMinForPumpingUnitDetailDict, nanoDetailDict,skrDetailDict,fluidLevelDetailDict,flapDetailDict,ffsDetailDict,tpDetailDict,cpDetailDict,mhDetailDict,pusDetailDict,tsDetailDict,tatDetailDict,psrpDetailDict,rcssrDetailDict, rcfsrDetailDict,sbDetailDict,mftDetailDict,rsiDetailDict,wvDetailDict, drDetailDict]

        
        let fourthCellDict = ["Background Color" : fourthCellColor, "Border Color" : fourthCellBorderColor, "Image" : "design", "Name" : "Design Engineering","DetailInfo" : fourthCellDetailedArray] as [String : Any]
        
        //Fifth Cell Details
        
        let apiDetailDict = ["Main" : "API(in degress)","Number" : "320,000 in-lbs"]
        let gowDetailDict = ["Main" : "Gravity of Water(Milgrams per liter)","Number" : "60.366"]
        let ppDetailDict = ["Main" : "Pump in-take Pressure","Number" : "50"]
        let ocoDetailDict = ["Main" : "Oil Cut (Oil)","Number" : "56"]
        let ocwDetailDict = ["Main" : "Oil Cut (Water)","Number" : "86"]
        let tvoDetailDict = ["Main" : "Total Volume(Oil)","Number" : "66"]
        let tvwDetailDict = ["Main" : "Total Volume(Water)","Number" : "2.3655"]
        let gvDetailDict = ["Main" : "Gas Volume","Number" : "4.3655"]
        let gcDetailDict = ["Main" : "Gas Composition","Number" : "5.32541"]
        
        let fifthCellDetailedArray = [apiDetailDict,gowDetailDict,ppDetailDict,ocoDetailDict, ocwDetailDict,tvoDetailDict,tvwDetailDict,gvDetailDict,gcDetailDict]

        
        let fifthCellDict = ["Background Color" : fifthCellColor, "Border Color" : fifthCellBorderColor, "Image" : "fluid", "Name" : "Fluid Make-Up","DetailInfo" : fifthCellDetailedArray] as [String : Any]
        
        
        //Sixth Cell Details
        
        let productDetailDict = ["Main" : "Product","Name Of Chemical" : "Hydrogen Peroxide","Fix" : "High","Frequency" : "2.2 kcal/mol higher","Calculation Of Parts Per Million" : "","Service Company" : "ONJC","Delivery" : "14-July-2017","Application Description" : "Chemical","Contact Name" : "Root","Contact Number" : "9678212454","Contact Email" : "root.r@gmail.com"]
        
        let sixthCellDetailedArray = [productDetailDict]
        
        let sixthCellDict = ["Background Color" : sixthCellColor, "Border Color" : sixthCellBorderColor, "Image" : "chemicals", "Name" : "Chemicals Treating","DetailInfo" : sixthCellDetailedArray] as [String : Any]
        
        //Seventh Cell Details
        
        let apiDetailDict2 = ["Main" : "API(in degress)","Number" : "320,000 in-lbs"]
        let gowDetailDict2 = ["Main" : "Gravity of Water(Milgrams per liter)","Number" : "60.366"]
        let ppDetailDict2 = ["Main" : "Pump in-take Pressure","Number" : "50"]
        let ocoDetailDict2 = ["Main" : "Oil Cut (Oil)","Number" : "56"]
        let ocwDetailDict2 = ["Main" : "Oil Cut (Water)","Number" : "86"]
        let tvoDetailDict2 = ["Main" : "Total Volume(Oil)","Number" : "66"]
        let tvwDetailDict2 = ["Main" : "Total Volume(Water)","Number" : "2.3655"]
        let gvDetailDict2 = ["Main" : "Gas Volume","Number" : "4.3655"]
        let gcDetailDict2 = ["Main" : "Gas Composition","Number" : "5.32541"]

        let seventhCellDetailedArray = [apiDetailDict2,gowDetailDict2,ppDetailDict2,ocoDetailDict2,ocwDetailDict2,tvoDetailDict2,tvwDetailDict2,gvDetailDict2,gcDetailDict2]
        
        let seventhCellDict = ["Background Color" : seventhCellColor, "Border Color" : seventhCellBorderColor, "Image" : "rod", "Name" : "Rod Star","DetailInfo" : seventhCellDetailedArray] as [String : Any]
        
        //Eight Cell Details
        
        let apiDetailDict3 = ["Main" : "API(in degress)","Number" : "320,000 in-lbs"]
        let gowDetailDict3 = ["Main" : "Gravity of Water(Milgrams per liter)","Number" : "60.366"]
        let ppDetailDict3 = ["Main" : "Pump in-take Pressure","Number" : "50"]
        let ocoDetailDict3 = ["Main" : "Oil Cut (Oil)","Number" : "56"]
        let ocwDetailDict3 = ["Main" : "Oil Cut (Water)","Number" : "86"]
        let tvoDetailDict3 = ["Main" : "Total Volume(Oil)","Number" : "66"]
        let tvwDetailDict3 = ["Main" : "Total Volume(Water)","Number" : "2.3655"]
        let gvDetailDict3 = ["Main" : "Gas Volume","Number" : "4.3655"]
        let gcDetailDict3 = ["Main" : "Gas Composition","Number" : "5.32541"]
        
        let eighthCellDetailedArray = [apiDetailDict3,gowDetailDict3,ppDetailDict3,ocoDetailDict3,ocwDetailDict3,tvoDetailDict3,tvwDetailDict3,gvDetailDict3,gcDetailDict3]
        
        let eightCellDict = ["Background Color" : eightCellColor, "Border Color" : eightCellBorderColor, "Image" : "analysis", "Name" : "Failure Analysis & Resolution","DetailInfo" : eighthCellDetailedArray] as [String : Any]
        
        wellInfoArray = [firstCellDict, secondCellDict, thirdCellDict, fourthCellDict, fifthCellDict, sixthCellDict,seventhCellDict,eightCellDict];
        
        wellInfoArrayFromModel = WellInfoHelper.productInformationParsing(reposeObject: wellInfoArray)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (wellInfoCollectionView.frame.size.width - 50)/2 , height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return wellInfoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! WellInfoCollectionViewCell
        let wellInfoDictionary = wellInfoArray[indexPath.row] as! NSDictionary
        
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 5.0
        
        cell.backgroundColor = wellInfoDictionary.object(forKey: "Background Color") as! UIColor?
        
        let borderColor = wellInfoDictionary.object(forKey: "Border Color")
        cell.layer.borderColor = borderColor as! CGColor?
        
        let imageName = wellInfoDictionary.object(forKey: "Image") as! String?
        cell.wellInfoCellImageView.image = UIImage(named:imageName!)
        cell.wellInfoLabel.text = wellInfoDictionary.object(forKey: "Name") as! String?;
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let selectedDict  = wellInfoArray[indexPath.row] as! NSDictionary
        let selectedName = selectedDict.object(forKey: "Name") as! NSString
        
        let wellDetailInfoController : WellDetailInfoViewController = WellDetailInfoViewController(nibName:NibNamed.WellDetailInfoViewController.rawValue, bundle:nil)
        
        if selectedName == "Contact Information"
        {
            wellDetailInfoController.titleName = selectedName
            wellDetailInfoController.contactInfoArray =  wellInfoArrayFromModel[0].contactInfoArray
        }
        else if selectedName == "Producing Assets"
        {
            wellDetailInfoController.titleName = selectedName
            wellDetailInfoController.producingAssestArray =  wellInfoArrayFromModel[0].producingAssestArray
        }
        else if selectedName == "Service Companies"
        {
            wellDetailInfoController.titleName = selectedName
            wellDetailInfoController.serviceCompArray =  wellInfoArrayFromModel[0].serviceCompArray
        }

        else if selectedName == "Design Engineering"
        {
            wellDetailInfoController.titleName = selectedName
            wellDetailInfoController.designEnggArray =  wellInfoArrayFromModel[0].designEnggArray
        }

        else if selectedName == "Fluid Make-Up"
        {
            wellDetailInfoController.titleName = selectedName
            wellDetailInfoController.fluidMakeUpArray =  wellInfoArrayFromModel[0].fluidMakeUpArray
        }

        else if selectedName == "Chemicals Treating"
        {
            wellDetailInfoController.titleName = selectedName
            wellDetailInfoController.chemTretingArray =  wellInfoArrayFromModel[0].chemTretingArray
        }
        else if selectedName == "Rod Star"
        {
            wellDetailInfoController.titleName = selectedName
            wellDetailInfoController.rodStarArray =  wellInfoArrayFromModel[0].rodStarArray
        }
        else if selectedName == "Failure Analysis & Resolution"
        {
            wellDetailInfoController.titleName = selectedName
            wellDetailInfoController.failureAnalysisArray =  wellInfoArrayFromModel[0].failureAnalysisArray
        }

        self.navigationController!.pushViewController(wellDetailInfoController, animated: true)
        
    }
    
    @IBAction func backBtnAction(_ sender: Any)
    {
        _ = navigationController?.popViewController(animated: true)
    }
   
}
