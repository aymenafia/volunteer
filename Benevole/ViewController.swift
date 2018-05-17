import UIKit
import SafariServices
import Photos
import RSSelectionMenu


class ViewController: UIViewController {
    
    // MARK: Enums
    
    enum AlertType: String {
        
        case simple = "Simple"
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
            case .oneTextField1,.oneTextField2, .twoTextFields:
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
    
    fileprivate lazy var alerts: [AlertType] = [.oneTextField1,.oneTextField2,  .countryPicker,.regionPicker]
    
    // MARK: UI Metrics
    
    struct UI {
        static let itemHeight: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 88 : 65
        static let lineSpacing: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 28 : 20
        static let xInset: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 40 : 20
        static let topInset: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 40 : 28
    }
    
    
    // MARK: Properties
    
    fileprivate var alertStyle: UIAlertControllerStyle = .actionSheet
    
    fileprivate lazy var segments: SegmentedControl = {
        let styles: [String] = ["Alert", "ActionSheet"]
        $0.segmentTitles = styles
        $0.action { [unowned self] index in
            switch styles[index] {
            case "Alert":           self.alertStyle = .alert
            case "ActionSheet":     self.alertStyle = .actionSheet
            default: break }
        }
        $0.tintColor = UIColor(hex: 0xFF2DC6)//UIColor(hex: 0x3C3C3C)
        return $0
    }(SegmentedControl())
    
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
        //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        
        
        self.view.addSubview(button)
        
        
        
        let imageName = "step1"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 178, y: 110, width: 220, height: 19)
        view.addSubview(imageView)
        
        
        
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
    
    func show(alert type: AlertType) {
        switch type {
            
        case .simple:
            let alert = UIAlertController(style: self.alertStyle, title: "Simple Alert", message: "3 kinds of actions")
            alert.addAction(title: "Default", style: .default)
            alert.addAction(title: "Cancel", style: .cancel)
            alert.addAction(title: "Destructive", style: .destructive)
            alert.show()
            
        case .simpleWithImages:
            let alert = UIAlertController(style: self.alertStyle)
            alert.set(title: "Simple Alert", font: .systemFont(ofSize: 20), color: UIColor(hex: 0xFF2D55))
            alert.set(message: "3 kinds of actions with images", font: .systemFont(ofSize: 14), color: UIColor(hex: 0xFF9500))
            alert.addAction(image: #imageLiteral(resourceName: "clip"), title: "Attache File", color: UIColor(hex: 0xFF2DC6), style: .default)
            alert.addAction(title: "Cancel", style: .cancel) //.cancel action will always be at the end
            alert.addAction(image: #imageLiteral(resourceName: "login"), title: "Login", style: .destructive, isEnabled: false)
            alert.show()
            
        case .oneTextField1:
            let alert = UIAlertController(style: self.alertStyle, title: "Entrer le Nom de l'organisation", message: "")
            
            let textField: TextField.Config = { textField in
                textField.left(image: #imageLiteral(resourceName: "pen"), color: .black)
                textField.leftViewPadding = 12
                textField.becomeFirstResponder()
                textField.borderWidth = 1
                textField.cornerRadius = 8
                textField.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
                textField.backgroundColor = nil
                textField.textColor = .black
                textField.placeholder = ""
                textField.keyboardAppearance = .default
                textField.keyboardType = .default
                //textField.isSecureTextEntry = true
                textField.returnKeyType = .done
                textField.action { textField in
                    Log("textField = \(String(describing: textField.text))")
                    
                    
                }
            }
            
            alert.addOneTextField(configuration: textField)
            
            alert.addAction(title: "OK", style: .cancel)
            alert.show()
            
        case .oneTextField2:
            let alert = UIAlertController(style: self.alertStyle, title: "Entrer votre Site internet", message: "")
            
            let textField: TextField.Config = { textField in
                textField.left(image: #imageLiteral(resourceName: "pen"), color: .black)
                textField.leftViewPadding = 12
                textField.becomeFirstResponder()
                textField.borderWidth = 1
                textField.cornerRadius = 8
                textField.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
                textField.backgroundColor = nil
                textField.textColor = .black
                textField.placeholder = ""
                textField.keyboardAppearance = .default
                textField.keyboardType = .default
                //textField.isSecureTextEntry = true
                textField.returnKeyType = .done
                textField.action { textField in
                    Log("textField = \(String(describing: textField.text))")
                    
                    
                }
            }
            
            alert.addOneTextField(configuration: textField)
            
            alert.addAction(title: "OK", style: .cancel)
            alert.show()
        case .twoTextFields:
            let alert = UIAlertController(style: self.alertStyle)
            
            let textFieldOne: TextField.Config = { textField in
                textField.left(image: #imageLiteral(resourceName: "user"), color: UIColor(hex: 0x007AFF))
                textField.leftViewPadding = 16
                textField.leftTextPadding = 12
                textField.becomeFirstResponder()
                textField.backgroundColor = nil
                textField.textColor = .black
                textField.placeholder = "Name"
                textField.clearButtonMode = .whileEditing
                textField.autocapitalizationType = .none
                textField.keyboardAppearance = .default
                textField.keyboardType = .default
                textField.returnKeyType = .continue
                textField.action { textField in
                    Log("textField = \(String(describing: textField.text))")
                }
            }
            
            let textFieldTwo: TextField.Config = { textField in
                textField.left(image: #imageLiteral(resourceName: "padlock"), color: UIColor(hex: 0x007AFF))
                textField.leftViewPadding = 16
                textField.leftTextPadding = 12
                textField.borderWidth = 1
                textField.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
                textField.backgroundColor = nil
                textField.textColor = .black
                textField.placeholder = "Password"
                textField.clearsOnBeginEditing = true
                textField.autocapitalizationType = .none
                textField.keyboardAppearance = .default
                textField.keyboardType = .default
                textField.isSecureTextEntry = true
                textField.returnKeyType = .done
                textField.action { textField in
                    Log("textField = \(String(describing: textField.text))")
                }
            }
            
            alert.addTwoTextFields(
                height: self.alertStyle == .alert ? 44 : 58,
                hInset: self.alertStyle == .alert ? 12 : 0,
                vInset: self.alertStyle == .alert ? 12 : 0,
                textFieldOne: textFieldOne,
                textFieldTwo: textFieldTwo)
            
            alert.addAction(title: "Sign in", style: .cancel)
            alert.show()
            
        case .dataPicker:
            let alert = UIAlertController(style: self.alertStyle, title: "Date Picker", message: "Select Date")
            alert.addDatePicker(mode: .dateAndTime, date: Date(), minimumDate: nil, maximumDate: nil) { date in
                Log(date)
            }
            alert.addAction(title: "Done", style: .cancel)
            alert.show()
            
        case .pickerView:
            let alert = UIAlertController(style: self.alertStyle, title: "Picker View", message: "Preferred Content Height")
            
            let frameSizes: [CGFloat] = (150...300).map { CGFloat($0) }
            let pickerViewValues: [[String]] = [frameSizes.map { Int($0).description }]
            let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: frameSizes.index(of: 216) ?? 0)
            
            alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
                
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 1) {
                        vc.preferredContentSize.height = frameSizes[index.row]
                    }
                }
            }
            alert.addAction(title: "Done", style: .cancel)
            alert.show()
            
        case .countryPicker:
//            let alert = UIAlertController(style: self.alertStyle)
//            alert.addLocalePicker(type: .country) { info in Log(info)
//
//                print("le pays est"+(info?.country)!)
//            }
//            alert.addAction(title: "Cancel", style: .cancel)
//            alert.show()
//
            print("countryPicker")
            let simpleDataArray = ["Abitibi-Témiscamingue",
                "Bas-St-Laurent",
                "apitale-Nationale",
                "Centre-du-Québec",
                "Chaudière-Appalaches",
               "Côte-Nord",
                "Estrie",
                "Gaspésie–Îles-de-la-Madeleine",
                "Lanaudière",
                "Laurentides",
                "Laval",
                "Mauricie",
                "Montérégie",
                "Montréal",
                "Outaouais",
                "Saguenay-Lac-St-Jean"]
         
            
            // Show menu with datasource array - Default SelectionType = Single
            // Here you'll get cell configuration where you can set any text based on condition
            // Cell configuration following parameters.
            // 1. UITableViewCell   2. Object of type T   3. IndexPath
                var simpleSelectedArray = [String]()
            let selectionMenu =  RSSelectionMenu(dataSource: simpleDataArray) { (cell, object, indexPath) in
                cell.textLabel?.text = object
                
                // Change tint color (if needed)
                cell.tintColor = .orange
            }
            
            // set default selected items when menu present on screen.
            // Here you'll get onDidSelectRow
            
            selectionMenu.setSelectedItems(items: simpleSelectedArray) { (text, isSelected, selectedItems) in
                
                // update your existing array with updated selected items, so when menu presents second time updated items will be default selected.
          simpleSelectedArray = selectedItems
                print(String(describing: selectedItems))
                self.value = simpleSelectedArray
            }
            selectionMenu.showSearchBar(withPlaceHolder: "Search Player", tintColor: UIColor.white) { (searchtext) -> ([String]) in
                return simpleDataArray.filter({ $0.lowercased().hasPrefix(searchtext.lowercased()) })
            }
            
            // customize default cancel button of seachbar
            // 1. Set cancel button title to "Dismiss"
            // 2. Change tint color. - nil value will set the default tint color
            
            selectionMenu.searchBarCancelButtonAttributes = SearchBarCancelButtonAttributes("Dismiss", nil)
            // show as PresentationStyle = Push
            //selectionMenu.show(style: .Present, from: self)
            selectionMenu.show(style: .Formsheet, from: self)

           
        case .regionPicker:
//            let alert = UIAlertController(style: self.alertStyle)
//            alert.addLocalePicker(type: .country) { info in Log(info)
//
//                print("le pays est"+(info?.country)!)
//            }
//            alert.addAction(title: "Cancel", style: .cancel)
//            alert.show()
            
            var simpleDataArray = ["Abitibi-Témiscamingue"]
            if (value == ["Abitibi-Témiscamingue"]){
                simpleDataArray = ["Centre d'action bénévole l'Amicale" , "Centre de bénévolat Rouyn-Noranda"]
                print("ok")
                
            }
         
            if (value == ["Bas-St-Laurent"]){
                simpleDataArray = ["Centre d'action bénévole Cormoran" , "Centre d'action bénévole de La Mitis", "Centre d'action bénévole de la région de Matane" , "Centre d'action bénévole des Basques", "Centre d'action bénévole des Seigneuries" , "Centre d'action bénévole Région Témis", "Centre d'action bénévole Rimouski-Neigette", "Centre d'action bénévole Vallée-de-la Matapédia"]
                print("ok")
                
            }
           
            if (value == ["Capitale-Nationale"]){
                simpleDataArray = ["Association Bénévole de Charlevoix", "Centre d'action bénévole de Québec", "Centre d'action bénévole du Contrefort", "Centre d’action bénévole Aide 23"]
                print("ok")
                
            }
            
            if (value == ["Chaudière-Appalaches"]){
                simpleDataArray = [ "Centre d'action bénévole Beauce-Etchemin", "Centre d'action bénévole Bellechasse - Lévis - Lotbinière", "Centre d'entraide communautaire bénévole Montmagny-L'Islet", "Centre d’action bénévole Concert’Action"]
                print("ok")
                
            }
            
            if (value == ["Centre-du-Québec"]){
                simpleDataArray = ["Carrefour d'entraide bénévole des Bois-Francs", "Centre d'action bénévole de Nicolet", "Centre d'action bénévole Drummond", "Centre d'action bénévole du Lac-Saint-Pierre", "Centre d’action bénévole de l’Érable" , "Centre d’action bénévole de la MRC de Bécancour"]
                print("ok")
                
            }
            
            if (value == ["Côte-Nord"]){
                simpleDataArray = ["Centre d'action bénévole de La Minganie" , "Centre d'action Bénévole de Port-Cartier", "Centre d'action bénévole Le Nordest"]
                print("ok")
                
            }
            
            if (value == ["Estrie"]){
                simpleDataArray = ["Centre d'action bénévole aux 4 vents", "Centre d'action bénévole de Cowansville","Centre d'action bénévole de la Missisquoi-Nord","Centre d'action bénévole de la MRC de Coaticook","Centre d'action bénévole de Magog","Centre d'action bénévole de Richmond","Centre d'action bénévole de Sherbrooke","Centre d'action bénévole de Windsor & Région","Centre d'action bénévole des sources","Centre d'action bénévole du Granit","Centre d’action bénévole de Bedford et environs" ,"Centre d’action bénévole de Farnham","Centre d’action bénévole de Granby","Centre d’action bénévole du Haut-Saint-François","Centre d’action bénévole R.H. Rediker","Centre d’action bénévole Valcourt et Région"]
                print("ok")
                
            }
            if (value == ["Gaspésie–Îles-de-la-Madeleine"]){
                simpleDataArray = ["Centre d'action bénévole des Chic-Chocs","Centre d'action bénévole Gascons-Percé","Centre d'action bénévole La Grande Corvée","Centre d'action bénévole Le Hauban","Centre d'action bénévole Les Hauts-Bois inc.","Centre d'action bénévole Saint-Alphonse-Nouvelle","Centre d’action bénévole Ascension Escuminac","Centre d’action bénévole des Îles-de-la-Madeleine","Centre d’action bénévole Saint-Siméon/Port-Daniel"]
                print("ok")
                
            }
            if (value == ["Lanaudière"]){
                simpleDataArray = ["Centre communautaire bénévole Matawinie", "Centre d'action bénévole D'Autray","Centre d'action bénévole de Brandon","Centre d'action bénévole de Montcalm","Centre d'action bénévole des Moulins","Centre d’action bénévole Émilie-Gamelin","Service bénévole comté l'Assomption"]
                print("ok")
                
            }
            
            if (value == ["Laurentides"]){
                simpleDataArray = ["Centre d'action bénévole Argenteuil", "Centre d'action bénévole Laurentides","Centre d'action bénévole Léoonie-Bélanger","Centre d'action bénévole Les Artisans de l'aide","Centre d'action bénévole Saint-Jérôme inc","Centre d'action bénévole Solange-Beauchamp", "Entraide bénévole des Pays-d'en-Haut"]
                print("ok")
                
            }
            
            if (value == ["Laval"]){
                simpleDataArray = ["Centre de bénévolat et moisson Laval"]
                print("ok")
                
            }
            
            if (value == ["Mauricie"]){
                simpleDataArray = ["Carrefour d’action bénévole du Haut St-Maurice", "Centre d'action bénévole de Grand-Mère", "Centre d'action bénévole de la Moraine", "Centre d'action bénévole de la MRC de Maskinongé","Centre d'action bénévole de la région de Shawinigan", "Centre d'action bénévole des Riverains", "Centre d'action bénévole du Rivage", "Centre d'action bénévole Laviolette", "Centre d'action bénévole Mékinac"]
                print("ok")
                
            }
            
            if (value == ["Montérégie"]){
                simpleDataArray = ["Centre d'action bénévole Les petits bonheurs","Centre d'action bénévole d'Iberville et région","Centre d'action bénévole de Boucherville","Centre d'action bénévole de Saint-Césaire", "Centre d'action bénévole de Saint-Hubert", "Centre d'action bénévole de St-Jean-sur-Richelieu", "Centre d'action bénévole du Bas-Richelieu", "Centre d'action bénévole du Contrecoeur", "Centre d'action bénévole du Grand Châteauguay", "Centre d'action bénévole L'Actuel", "Centre d'action bénévole la Seigneurie de Monnoir", "Centre d'action bénévole Soulanges", "Centre d’action bénévole de Beauharnoi", "Centre d’action bénévole de la Frontière", "Centre d’action bénévole de la Vallée du Richelieu","Centre de bénévolat Acton-Vale", "Centre de bénévolat de la Rive-Sud", "Centre Entraide Régional Henryville (C.E.R.H.)", "L’Envolée, Centre d’action bénévole Sainte-Julie", "La Mosaïque, Le Centre de Bénévolat de St-Hyacinthe", "Service d'Action Bénévole « Au c?ur du jardin »"]
                print("ok")
                
            }
            
            if (value == ["Montréal"]){
                simpleDataArray = ["Accès Bénévolat-Centre d'action bénévole Est de Montréal", "Centre d'action bénévole Bordeaux-Cartierville", "Centre d'action bénévole de Montréal", "Centre d'action bénévole de Montréal-Nord", "Centre d'action bénévole de Rivière-des-Prairies", "Centre d'action bénévole de Saint-Laurent","Centre d'action bénévole Ouest de l'île / Volunteer West Island", "Fédération des centres d'action bénévole du Québec"]
                print("ok")
                
            }
            
            if (value == ["Outaouais"]){
                simpleDataArray = ["Centre d'action bénévole Accès", "Centre d'action bénévole de Gatineau", "Centre d'action bénévole de Hull", "Centre d'entraide aux aînés"]
                print("ok")
                
            }
            
            
            if (value == ["Saguenay-Lac-St-Jean"]){
                simpleDataArray = ["CAB Chicoutimi", "Centre d'action bénévole de Jonquière", "Centre d'action bénévole de Saint-Félicien", "Centre d'action bénévole du lac", "Centre d'action bénévole Maria-Chapdelaine", "Centre de bénévolat « Soif de Vivre » de La Baie"]
                print("ok")
                
            }
            
            
            // Show menu with datasource array - Default SelectionType = Single
            // Here you'll get cell configuration where you can set any text based on condition
            // Cell configuration following parameters.
            // 1. UITableViewCell   2. Object of type T   3. IndexPath
            var simpleSelectedArray = [String]()
            let selectionMenu =  RSSelectionMenu(dataSource: simpleDataArray) { (cell, object, indexPath) in
                cell.textLabel?.text = object
                
                // Change tint color (if needed)
                cell.tintColor = .orange
            }
            
            // set default selected items when menu present on screen.
            // Here you'll get onDidSelectRow
            
            selectionMenu.setSelectedItems(items: simpleSelectedArray) { (text, isSelected, selectedItems) in
                
                // update your existing array with updated selected items, so when menu presents second time updated items will be default selected.
                simpleSelectedArray = selectedItems
                print(String(describing: selectedItems))
                self.value = simpleSelectedArray
            }
            selectionMenu.showSearchBar(withPlaceHolder: "Search Player", tintColor: UIColor.white) { (searchtext) -> ([String]) in
                return simpleDataArray.filter({ $0.lowercased().hasPrefix(searchtext.lowercased()) })
            }
            
            // customize default cancel button of seachbar
            // 1. Set cancel button title to "Dismiss"
            // 2. Change tint color. - nil value will set the default tint color
            
            selectionMenu.searchBarCancelButtonAttributes = SearchBarCancelButtonAttributes("Dismiss", nil)
            // show as PresentationStyle = Push
            //selectionMenu.show(style: .Present, from: self)
            selectionMenu.show(style: .Formsheet, from: self)
            
            
            
            
            
            
            
            
            
            
            
            print("regionPicker")
        case .phoneCodePicker:
            let alert = UIAlertController(style: self.alertStyle)
            alert.addLocalePicker(type: .phoneCode) { info in Log(info) }
            alert.addAction(title: "Cancel", style: .cancel)
            alert.show()
            
        case .currencyPicker:
            let alert = UIAlertController(style: self.alertStyle)
            alert.addLocalePicker(type: .currency) { info in Log(info) }
            alert.addAction(title: "Cancel", style: .cancel)
            alert.show()
            
        case .imagePicker:
            let photos: [UIImage] = [#imageLiteral(resourceName: "interior_design_1"), #imageLiteral(resourceName: "interior_design_2"), #imageLiteral(resourceName: "interior_design_3"), #imageLiteral(resourceName: "interior_design_4"), #imageLiteral(resourceName: "interior_design_5"), #imageLiteral(resourceName: "interior_design_8"), #imageLiteral(resourceName: "interior_design_9"), #imageLiteral(resourceName: "interior_design_10"), #imageLiteral(resourceName: "interior_design_11"), #imageLiteral(resourceName: "interior_design_12"), #imageLiteral(resourceName: "interior_design_13"), #imageLiteral(resourceName: "interior_design_14"), #imageLiteral(resourceName: "interior_design_15"), #imageLiteral(resourceName: "interior_design_16"), #imageLiteral(resourceName: "interior_design_17"), #imageLiteral(resourceName: "interior_design_18"), #imageLiteral(resourceName: "interior_design_19"), #imageLiteral(resourceName: "interior_design_20"), #imageLiteral(resourceName: "interior_design_21"), #imageLiteral(resourceName: "interior_design_22"), #imageLiteral(resourceName: "interior_design_23"), #imageLiteral(resourceName: "interior_design_24"), #imageLiteral(resourceName: "interior_design_25"), #imageLiteral(resourceName: "interior_design_26"), #imageLiteral(resourceName: "interior_design_27"), #imageLiteral(resourceName: "interior_design_28"), #imageLiteral(resourceName: "interior_design_29"), #imageLiteral(resourceName: "interior_design_30"), #imageLiteral(resourceName: "interior_design_31"), #imageLiteral(resourceName: "interior_design_32"), #imageLiteral(resourceName: "interior_design_33"), #imageLiteral(resourceName: "interior_design_34"), #imageLiteral(resourceName: "interior_design_35"), #imageLiteral(resourceName: "interior_design_36"), #imageLiteral(resourceName: "interior_design_37"), #imageLiteral(resourceName: "interior_design_38"), #imageLiteral(resourceName: "interior_design_39")]
            
            let alert = UIAlertController(style: self.alertStyle)
            alert.addImagePicker(
                flow: .vertical,
                paging: false,
                images: photos,
                selection: .single(action: { image in
                    Log(image)
                }))
            alert.addAction(title: "OK", style: .cancel)
            alert.show()
            
        case .photoLibraryPicker:
            let alert = UIAlertController(style: self.alertStyle)
            alert.addPhotoLibraryPicker(flow: .vertical, paging: false,
                selection: .multiple(action: { assets in Log(assets) }))
            alert.addAction(title: "Cancel", style: .cancel)
            alert.show()
            
            
        case .colorPicker:
            let alert = UIAlertController(style: self.alertStyle)
            alert.addColorPicker(color: UIColor(hex: 0xFF2DC6)) { color in Log(color) }
            alert.addAction(title: "Cancel", style: .cancel)
            alert.show()
            
        case .textViewer:
            let alert = UIAlertController(style: self.alertStyle)
            
            let text: [AttributedTextBlock] = [
                .normal(""),
                .header1("U.S. Returns & Refunds Policy."),
                .header2("Standard Return Policy."),
                .normal("There are a few important things to keep in mind when returning a product you purchased online from Apple:"),
                .list("You have 14 calendar days to return an item from the date you received it."),
                .list("Only items that have been purchased directly from Apple, either online or at an Apple Retail Store, can be returned to Apple. Apple products purchased through other retailers must be returned in accordance with their respective returns and refunds policy."),
                .list("Please ensure that the item you're returning is repackaged with all the cords, adapters and documentation that were included when you received it."),
                .normal("There are some items, however, that are ineligible for return, including:"),
                .list("Opened software"),
                .list("Electronic Software Downloads"),
                .list("Software Up-to-Date Program Products (software upgrades)"),
                .list("Apple Store Gift Cards"),
                .list("Apple Developer products (membership, technical support incidents, WWDC tickets)"),
                .list("Apple Print Products"),
                .normal("*You can return software, provided that it has not been installed on any computer. Software that contains a printed software license may not be returned if the seal or sticker on the software media packaging is broken.")]
            alert.addTextViewer(text: .attributedText(text))
            alert.addAction(title: "OK", style: .cancel)
            alert.show()
            
        case .contactsPicker:
            let alert = UIAlertController(style: self.alertStyle)
            alert.addContactsPicker { contact in Log(contact) }
            alert.addAction(title: "Cancel", style: .cancel)
            alert.show()
            
        case .locationPicker:
            let alert = UIAlertController(style: self.alertStyle)
            alert.addLocationPicker { location in Log(location) }
            alert.addAction(title: "Cancel", style: .cancel)
            alert.show()
            
        case .telegramPicker:
            let alert = UIAlertController(style: .actionSheet)
            alert.addTelegramPicker { result in
                switch result {
                case .photo(let assets):
                    Log(assets)
                case .contact(let contact):
                    Log(contact)
                case .location(let location):
                    Log(location)
                }
            }
            alert.addAction(title: "Cancel", style: .cancel)
            alert.show()
        }
    }
}

// MARK: - CollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Log("selected alert - \(alerts[indexPath.item].rawValue)")
        show(alert: alerts[indexPath.item])
    }
}

// MARK: - CollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
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



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
