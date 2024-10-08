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
    
    var kisi: KisilerModel?
    
    var viewModel = KisiDetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let human = kisi {

            kisiAdiTextField.text = human.kisiAdi
            kisiTelTextField.text = human.kisiTel
        }
    }
    

    @IBAction func updateButton(_ sender: Any) {
        if let ka = kisiAdiTextField.text, let kt = kisiTelTextField.text, let kı = kisi {
            viewModel.güncelle(kisiAdi: ka, kisiTel: kt, kisi: kı)  
        }
    }

   

}
