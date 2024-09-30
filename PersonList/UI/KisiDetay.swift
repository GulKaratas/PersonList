//
//  KisiDetay.swift
//  PersonList
//
//  Created by Gül Karataş on 30.09.2024.
//

import UIKit

class KisiDetay: UIViewController {

    @IBOutlet weak var kisiAdiTextField: UITextField!
    
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var kisi: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let human = kisi {

            human.kisiAdi = kisiAdiTextField.text
            human.kisiTel = kisiTelTextField.text
        }
    }
    

    @IBAction func updateButton(_ sender: Any) {
        if let ka = kisiAdiTextField.text, let kt = kisiTelTextField.text, let kı = kisi {
            güncelle(kisiAdi: ka, kisiTel: kt, kisiId: kı.kisiId!)
        }
    }
    func güncelle(kisiAdi:String,kisiTel:String,kisiId: Int){
        print("Kişi Adı : \(kisiAdi), Kişi Telefonu : \(kisiTel), Kişi ıd : \(kisiId)")
    }

}
