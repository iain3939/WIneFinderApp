//
//  WineDetailVC.swift
//  WineFinder
//
//  Created by iain Allen on 17/08/2020.
//

import UIKit

class WineDetailVC: UIViewController {

    let roundedContentCard = CardView()
    let roundedContentCard2 = CardView()
    let descriptionRoundedCard = CardView()
    let priceStock = CardView()
    let dietaryCard = CardView()
    let wineAlcohoCard = CardView()
    let pricelabel = WineTitleLabel(textAlignment: .left, fontSize: 17)
    let priceAmountlabel = WineTitleLabel(textAlignment: .left, fontSize: 20)
    let stockLabel = WineTitleLabel(textAlignment: .left, fontSize: 17)
    let stockAmountLabel = WineTitleLabel(textAlignment: .left, fontSize: 20)
    let imageView = DetailImageView(frame: .zero)
    let wineTitleLabel = WineTitleLabel(textAlignment: .center, fontSize: 17)
    let descriptionTitle = WineTitleLabel(textAlignment: .left, fontSize: 20)
    let wineDescription = WineTitleLabel(textAlignment: .left, fontSize: 15)
    let dietaryInformationTitleLabel = WineTitleLabel(textAlignment: .left, fontSize: 20)
    let dietaryInformationInfoLabel = WineTitleLabel(textAlignment: .left, fontSize: 15)
    let wineLocationLabel = WineTitleLabel(textAlignment: .left, fontSize: 15)
    let wineLocationTitleLabel = WineTitleLabel(textAlignment: .left, fontSize: 20)
    let wineAlcoholTitle = WineTitleLabel(textAlignment: .left, fontSize: 20)
    let wineAlcohoDescription = WineTitleLabel(textAlignment: .left, fontSize: 15)
    let wineRoundedLocationCard = CardView()
    let moreInfoButton = WFButton(backgroundColor: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), title: "More info")
    
    var itemViews: [UIView]      = []
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var selectedImage: Wine?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wineTitleLabel.numberOfLines = 0
       configureBackCardImageView()
        configurePriceStockCard()
        configureImageView()
        configureWineTitle()
        configurePriceStock()
        configureDescription()
        configureWineDescription()
        configureScrollView()
        configureWineDietary()
        configureWineLocation()
        configureViewController()
//        configureWineAlcohol()
       
        layoutUI()
        
        
        
    }
    
    func configureViewController() {
        navigationItem.largeTitleDisplayMode = .never
        let moreInfoButton = UIBarButtonItem(image: SFSymbols.profile, style: .plain, target: self, action: #selector(moreInfoButtonTappend))
        navigationItem.rightBarButtonItems = [moreInfoButton]
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad.wineImg)
        
               }
               wineTitleLabel.text = selectedImage?.wineName
               wineDescription.text = selectedImage?.wineDescription
                wineLocationLabel.text = selectedImage?.wineContry
            
    
        view.backgroundColor = .systemGroupedBackground
    }
    
    @objc func moreInfoButtonTappend() {
        
        if let vc = storyboard?.instantiateViewController(identifier: "MoreInfo") as? MoreInfoVC {
            vc.selectedWine = selectedImage
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
//      let destVC = MoreInfoVC()
//
//
//     let navController = UINavigationController(rootViewController: destVC)
//      present(navController, animated: true)
    }
    
    
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1100)
            
        ])
    }
    
    func layoutUI() {
        for itemView in itemViews {
            itemViews = [roundedContentCard, roundedContentCard2, descriptionRoundedCard, priceStock, wineAlcohoCard, dietaryCard, wineRoundedLocationCard]
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            
        }
       
    }
    
    func configureBackCardImageView() {
        contentView.addSubview(roundedContentCard)
        
        NSLayoutConstraint.activate([
            roundedContentCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            roundedContentCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            roundedContentCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            roundedContentCard.heightAnchor.constraint(equalToConstant: 400)
        ])
        
    }
        func configureImageView() {
            roundedContentCard.addSubview(imageView)
            imageView.contentMode = .scaleAspectFill
            
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: roundedContentCard.leadingAnchor, constant: 67),
                imageView.topAnchor.constraint(equalTo: roundedContentCard.topAnchor, constant: 0),
                imageView.trailingAnchor.constraint(equalTo: roundedContentCard.trailingAnchor, constant: -67),
                imageView.heightAnchor.constraint(equalToConstant: 355)

            ])
        }
    
    func configureWineTitle() {
        roundedContentCard.addSubview(wineTitleLabel)
//        wineTitleLabel.text = "Bouchard Aine Et Fils Pinot Noir 75cl"
        
        NSLayoutConstraint.activate([
            wineTitleLabel.leadingAnchor.constraint(equalTo: roundedContentCard.leadingAnchor, constant: 0),
            wineTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            wineTitleLabel.trailingAnchor.constraint(equalTo: roundedContentCard.trailingAnchor, constant: 0),
            wineTitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
        
    func configurePriceStockCard() {
        contentView.addSubview(roundedContentCard2)
            
            NSLayoutConstraint.activate([
                roundedContentCard2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                roundedContentCard2.topAnchor.constraint(equalTo: roundedContentCard.bottomAnchor, constant: 20),
                roundedContentCard2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                roundedContentCard2.heightAnchor.constraint(equalToConstant: 70)
            ])
        }
    
//    func configureWFButton() {
//        contentView.addSubview(moreInfoButton)
//
//        NSLayoutConstraint.activate([
//            moreInfoButton.topAnchor.constraint(equalTo: roundedContentCard2.bottomAnchor, constant: 20),
//            moreInfoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            moreInfoButton.heightAnchor.constraint(equalToConstant: 20),
//            moreInfoButton.bottomAnchor.constraint(equalTo: descriptionRoundedCard.topAnchor, constant: 20)
//        ])
//
//    }
    
    func configurePriceStock() {
        roundedContentCard2.addSubview(pricelabel)
        pricelabel.text = "Price"
        roundedContentCard2.addSubview(priceAmountlabel)
        priceAmountlabel.text = "£8.00"
        roundedContentCard2.addSubview(stockLabel)
        stockLabel.text = "Stock"
        roundedContentCard2.addSubview(stockAmountLabel)
        stockAmountLabel.text = "15"
        
        NSLayoutConstraint.activate([
            pricelabel.leadingAnchor.constraint(equalTo: roundedContentCard2.leadingAnchor, constant: 20),
            pricelabel.topAnchor.constraint(equalTo: roundedContentCard2.topAnchor, constant: 10),
            
            priceAmountlabel.leadingAnchor.constraint(equalTo: roundedContentCard2.leadingAnchor, constant: 20),
            priceAmountlabel.bottomAnchor.constraint(equalTo: roundedContentCard2.bottomAnchor, constant: -10),
            
            stockLabel.trailingAnchor.constraint(equalTo: roundedContentCard2.trailingAnchor, constant: -20),
            stockLabel.topAnchor.constraint(equalTo: roundedContentCard2.topAnchor, constant: 10),
            
            stockAmountLabel.trailingAnchor.constraint(equalTo: roundedContentCard2.trailingAnchor, constant: -20),
            stockAmountLabel.bottomAnchor.constraint(equalTo: roundedContentCard2.bottomAnchor, constant: -10)
        ])
    }
    
//    func configureWineAlcohol() {
//        contentView.addSubview(wineAlcohoCard)
//
//        NSLayoutConstraint.activate([
//            wineAlcohoCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            wineAlcohoCard.topAnchor.constraint(equalTo: roundedContentCard2.bottomAnchor, constant: 20),
//            wineAlcohoCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            wineAlcohoCard.heightAnchor.constraint(equalToConstant: 70)
//        ])
//    }
    
    
    
    func configureDescription() {
        contentView.addSubview(descriptionRoundedCard)
        
        NSLayoutConstraint.activate([
            descriptionRoundedCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionRoundedCard.topAnchor.constraint(equalTo: roundedContentCard2.bottomAnchor, constant: 20),
            descriptionRoundedCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionRoundedCard.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureWineDescription() {
        descriptionRoundedCard.addSubview(descriptionTitle)
        descriptionTitle.text = "Description"
        descriptionRoundedCard.addSubview(wineDescription)
//        wineDescription.text = "Full of history and with fine flavours, this wine pays tribute to the General Counsellor, a major figure of the family, who devoted his life to the renown of the noble grapes of his home region. In his honour, the house is perpetuating the tradition of quality, elegance and prestige in selecting and making fine wines which marvellously express all the richness of the French terroirs."
        wineDescription.numberOfLines = 0
        NSLayoutConstraint.activate([
            descriptionTitle.leadingAnchor.constraint(equalTo: descriptionRoundedCard.leadingAnchor,constant: 20),
            descriptionTitle.topAnchor.constraint(equalTo: descriptionRoundedCard.topAnchor, constant: 10),
            
            wineDescription.leadingAnchor.constraint(equalTo: descriptionRoundedCard.leadingAnchor, constant: 20),
            wineDescription.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 20),
            wineDescription.trailingAnchor.constraint(equalTo: descriptionRoundedCard.trailingAnchor, constant: -20),
            wineDescription.bottomAnchor.constraint(equalTo: descriptionRoundedCard.bottomAnchor, constant: -20)
            
        
        ])
    }
        func configureWineDietary() {
            contentView.addSubview(dietaryCard)
            dietaryCard.addSubview(dietaryInformationTitleLabel)
            dietaryInformationTitleLabel.text = "Dietary Information"
            dietaryCard.addSubview(dietaryInformationInfoLabel)
            dietaryInformationInfoLabel.text = "Contains Sulphur Dioxide/Sulphites Allergy Advice"
            
            
            NSLayoutConstraint.activate([
                dietaryCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                dietaryCard.topAnchor.constraint(equalTo: wineDescription.bottomAnchor, constant: 40),
                dietaryCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                dietaryCard.heightAnchor.constraint(equalToConstant: 120),
                
                dietaryInformationTitleLabel.leadingAnchor.constraint(equalTo: dietaryCard.leadingAnchor, constant: 20),
                dietaryInformationTitleLabel.topAnchor.constraint(equalTo: dietaryCard.topAnchor, constant: 20),
                
                dietaryInformationInfoLabel.leadingAnchor.constraint(equalTo: dietaryCard.leadingAnchor, constant: 20),
                dietaryInformationInfoLabel.topAnchor.constraint(equalTo: dietaryInformationTitleLabel.bottomAnchor, constant: 10),
                dietaryInformationInfoLabel.trailingAnchor.constraint(equalTo: dietaryCard.trailingAnchor, constant: -20),
                dietaryInformationInfoLabel.bottomAnchor.constraint(equalTo: dietaryCard.bottomAnchor, constant: -20)
            ])
            
            }
    
    
    func configureWineLocation() {
        contentView.addSubview(wineRoundedLocationCard)
        wineRoundedLocationCard.addSubview(wineLocationTitleLabel)
        wineLocationTitleLabel.text = "Country of Origin"
        wineRoundedLocationCard.addSubview(wineLocationLabel)
//        wineLocationLabel.text = "Country of origin: France"
        
        NSLayoutConstraint.activate([
            wineRoundedLocationCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            wineRoundedLocationCard.topAnchor.constraint(equalTo: dietaryCard.bottomAnchor, constant: 20),
            wineRoundedLocationCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            wineRoundedLocationCard.heightAnchor.constraint(equalToConstant: 90),
            
            wineLocationTitleLabel.leadingAnchor.constraint(equalTo: wineRoundedLocationCard.leadingAnchor, constant: 20),
            wineLocationTitleLabel.topAnchor.constraint(equalTo: wineRoundedLocationCard.topAnchor, constant: 20),
            
            wineLocationLabel.leadingAnchor.constraint(equalTo: wineRoundedLocationCard.leadingAnchor, constant: 20),
            wineLocationLabel.topAnchor.constraint(equalTo: wineLocationTitleLabel.bottomAnchor, constant: 10),
            wineLocationLabel.trailingAnchor.constraint(equalTo: wineRoundedLocationCard.trailingAnchor, constant: -20),
            wineLocationLabel.bottomAnchor.constraint(equalTo: wineRoundedLocationCard.bottomAnchor, constant: -20)
        ])
        
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    @IBOutlet weak var wineDetailImg: UIImageView!
//    @IBOutlet weak var wineDetailLbl: UILabel!
//    @IBOutlet weak var wineDetailDescriptionLbl: UILabel!
//    @IBOutlet weak var backImgCornerView: UIView!
//    @IBOutlet weak var priceCornerView: UIView!
//    @IBOutlet weak var descriptionbackCornerView: UIView!
//
//    let scrollView = UIScrollView()
//
//    var selectedImage: Wine?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.title = selectedImage?.wineName
//        navigationItem.largeTitleDisplayMode = .never
//        backImgCornerView.layer.cornerRadius = 10
//        priceCornerView.layer.cornerRadius = 10
//        descriptionbackCornerView.layer.cornerRadius = 10
//
//        if let imageToLoad = selectedImage {
//            wineDetailImg.image = UIImage(named: imageToLoad.wineImg)
//
//        }
//        wineDetailLbl.text = selectedImage?.wineName
//        wineDetailDescriptionLbl.text = selectedImage?.wineDescription
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
