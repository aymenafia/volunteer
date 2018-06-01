import UIKit
import SafariServices
import Photos
import RSSelectionMenu


class Etape1VC: UIViewController {
    
    
    
    
    var nomOrganisation : String = ""
    var internetSite : String = ""
    var regionAdministrative : String = ""
    var actionBenevole : String = ""
    
    // MARK: Enums
    
    enum AlertType: String {
        
        case simple = "Simple"
        case descriptionOffre = "description de l'offre"
        case simpleWithImages = "Simple +Images"
        case oneTextField1 = "Nom de l'organisation"
        case oneTextField2 = "Site internet"
        case twoTextFields = "Login form"
        case dataPicker = "Date Picker"
        case pickerView = "Picker View"
        case countryPicker = "Région administrative"
        case regionPicker = "Centre d'action bénévole"
        case phoneCodePicker = "Phone Code Picker"
        case currencyPicker = "Currency Picker"
        case imagePicker = "Image Picker"
        case photoLibraryPicker = "Photo Library Picker"
        case colorPicker = "Color Picker"
        case textViewer = "Text Viewer"
        case contactsPicker = "Contacts Picker"
        case locationPicker = "Location Picker"
        case telegramPicker = "Telegram Picker"
        
        var description: String {
            switch self {
            case .descriptionOffre: return ""
            case .simple: return "3 different buttons"
            case .simpleWithImages: return "3 buttons with image"
            case .dataPicker: return "Select date and time"
            case .pickerView: return "Select alert's main view height"
            case .oneTextField1: return ""
            case .oneTextField2: return ""
            case .twoTextFields: return "2 TextFields"
            case .countryPicker: return ""
            case .regionPicker: return ""
            case .phoneCodePicker: return "TableView"
            case .currencyPicker: return "TableView"
            case .imagePicker: return "CollectionView, horizontal flow"
            case .photoLibraryPicker: return "Select photos from Photo Library"
            case .colorPicker: return "Storyboard & Autolayout"
            case .textViewer: return "TextView, not editable"
            case .contactsPicker: return "With SearchController"
            case .locationPicker: return "MapView With SearchController"
            case .telegramPicker: return "Similar to the Telegram"
            }
        }
        
        var image: UIImage {
            switch self {
            case .descriptionOffre: return #imageLiteral(resourceName: "pen")
            case .simple: return #imageLiteral(resourceName: "title")
            case .simpleWithImages: return #imageLiteral(resourceName: "two_squares")
            case .dataPicker: return #imageLiteral(resourceName: "calendar")
            case .pickerView: return #imageLiteral(resourceName: "picker")
            case .oneTextField1: return #imageLiteral(resourceName: "pen")
            case .oneTextField2: return #imageLiteral(resourceName: "pen")
            case .twoTextFields: return #imageLiteral(resourceName: "login")
            case .countryPicker: return #imageLiteral(resourceName: "globe")
            case .regionPicker: return #imageLiteral(resourceName: "globe")
            case .phoneCodePicker: return #imageLiteral(resourceName: "telephone")
            case .currencyPicker: return #imageLiteral(resourceName: "currency")
            case .imagePicker: return #imageLiteral(resourceName: "listings")
            case .photoLibraryPicker: return #imageLiteral(resourceName: "four_rect")
            case .colorPicker: return #imageLiteral(resourceName: "colors")
            case .textViewer: return #imageLiteral(resourceName: "title")
            case .contactsPicker: return #imageLiteral(resourceName: "user")
            case .locationPicker: return #imageLiteral(resourceName: "planet")
            case .telegramPicker: return #imageLiteral(resourceName: "library")
            }
        }
        
        var color: UIColor? {
            switch self {
            case .simple, .simpleWithImages, .telegramPicker:
                return UIColor(hex: 0x007AFF)
            case .oneTextField1,.oneTextField2, .twoTextFields, .descriptionOffre:
                return UIColor(hex: 0x5AC8FA)
            case .dataPicker, .pickerView, .contactsPicker, .locationPicker:
                return UIColor(hex: 0x4CD964)
            case .regionPicker,.countryPicker, .phoneCodePicker, .currencyPicker, .textViewer:
                return UIColor(hex: 0xFF5722)
            case .imagePicker, .photoLibraryPicker:
                return UIColor(hex: 0xFF2DC6)
            case .colorPicker:
                return nil
            }
        }
    }
    
    fileprivate lazy var alerts: [AlertType] = [.descriptionOffre]
    
    // MARK: UI Metrics
    
    struct UI {
        static let itemHeight: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 88 : 65
        static let lineSpacing: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 28 : 20
        static let xInset: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 40 : 20
        static let topInset: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 40 : 28
    }
    
    
    // MARK: Properties
    
    fileprivate var alertStyle: UIAlertControllerStyle = .actionSheet
    
 
    
    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in
        
        
        $0.dataSource = self
        $0.delegate = self
        $0.register(TypeOneCell.self, forCellWithReuseIdentifier: TypeOneCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.decelerationRate = UIScrollViewDecelerationRateFast
        //$0.contentInsetAdjustmentBehavior = .never
        $0.bounces = true
        $0.backgroundColor = .white
        
        
        //$0.maskToBounds = false
        //$0.clipsToBounds = false
        $0.contentInset.bottom = UI.itemHeight
        return $0
        }(UICollectionView(frame: .zero, collectionViewLayout: layout))
    
    fileprivate lazy var layout: VerticalScrollFlowLayout = {
        $0.minimumLineSpacing = UI.lineSpacing
        $0.sectionInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        $0.itemSize = itemSize
        
        return $0
    }(VerticalScrollFlowLayout())
    
    fileprivate var itemSize: CGSize {
        let width = UIScreen.main.bounds.width - 2 * UI.xInset
        return CGSize(width: width, height: UI.itemHeight)
    }
    
    // MARK: Initialize
    
    //    required init() {
    //        super.init(nibName: nil, bundle: nil)
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    // MARK: ViewController LifeCycle
    
    
    override func loadView() {
        view = collectionView
    }
    var value = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 110, y: 600, width: 200, height: 50))
        button.backgroundColor = UIColor(hex: 0xEF4260)
        button.setTitle("Suivant", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        
        
        self.view.addSubview(button)
        
        
        
        let imageName = "step1"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 178, y: 55, width: 220, height: 19)
        //view.addSubview(imageView)
        
        
        
        //title = "Alerts & Pickers"
        
        //        navigationController?.navigationBar.backgroundColor = .white
        //        navigationController?.navigationBar.tintColor = .black
        //        navigationController?.navigationBar.isTranslucent = false
        //        navigationController?.navigationBar.shadowImage = UIImage()
        
        if #available(iOS 11.0, *) {
            //navigationController?.navigationBar.prefersLargeTitles = true
            //navigationItem.largeTitleDisplayMode = .always
        }
        
        layout.itemSize = itemSize
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
        
        //navigationItem.titleView = segments
        //alertStyle = .actionSheet
        //segments.selectedSegmentIndex = 1
    }
    
    
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
        let step2VC = storyboard?.instantiateViewController(withIdentifier: "step2") as! Step2ViewController
        
        
        step2VC.organisation = Organisation(userUID: "", nomOrganisation: nomOrganisation, siteInternet: internetSite, RegionAdministrative: regionAdministrative, CentreActionBenevole: actionBenevole, ImageOrganisation: "", EmailOrganisation: "")
        
        
        //step2VC.x = "hahahah"
        
        self.show(step2VC, sender: nil)
      //show(step2VC, sender: nil)
   }
    
    
    func show(alert type: AlertType) {
        switch type {
            
        case .simple:
            let alert = UIAlertController(style: self.alertStyle, title: "Simple Alert", message: "3 kinds of actions")
            alert.addAction(title: "Default", style: .default)
            alert.addAction(title: "Cancel", style: .cancel)
            alert.addAction(title: "Destructive", style: .destructive)
            alert.show()
            
        case .descriptionOffre:
            print("description offre clicked")
        case .simpleWithImages:
            print("")
        case .oneTextField1:
            print("")
        case .oneTextField2:
            print("")
        case .twoTextFields:
            print("")
        case .dataPicker:
            print("")
        case .pickerView:
            print("")
        case .countryPicker:
            print("")
        case .regionPicker:
            print("")
        case .phoneCodePicker:
            print("")
        case .currencyPicker:
            print("")
        case .imagePicker:
            print("")
        case .photoLibraryPicker:
            print("")
        case .colorPicker:
            print("")
        case .textViewer:
            print("")
        case .contactsPicker:
            print("")
        case .locationPicker:
            print("")
        case .telegramPicker:
            print("")
        }}}

// MARK: - CollectionViewDelegate

extension Etape1VC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Log("selected alert - \(alerts[indexPath.item].rawValue)")
        show(alert: alerts[indexPath.item])
    }
}

// MARK: - CollectionViewDataSource

extension Etape1VC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alerts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TypeOneCell.identifier, for: indexPath) as? TypeOneCell else { return UICollectionViewCell() }
        
        let alert = alerts[indexPath.item]
        item.imageView.image = alert.image
        item.imageView.tintColor = alert.color
        item.title.text = alert.rawValue
        item.subtitle.text = alert.description
        item.subtitle.textColor = .darkGray
        
        return item
    }
}




