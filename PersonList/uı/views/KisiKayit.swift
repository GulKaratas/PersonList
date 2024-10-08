//
//  KisiKayitViewController.swift
//  PersonList
//
//  Created by Gül Karataş on 30.09.2024.
//

import UIKit

class KisiKayit: UIViewController {

    @IBOutlet weak var kisiAdiTextField: UITextField!
    
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var viewModel = KisiKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let ka = kisiAdiTextField.text!
        let kt = kisiTelTextField.text!
        
        if !ka.isEmpty && !kt.isEmpty {
            viewModel.save(kisiAdi: ka, kisiTel: kt)
        }else {
            print ("Lütfen Kişi adı ve telefon numarasını giriniz.")
            
        }
    }
   
}
