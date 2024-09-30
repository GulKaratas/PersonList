//
//  ViewController.swift
//  PersonList
//
//  Created by Gül Karataş on 28.09.2024.
//

import UIKit

class Home: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func detailsButton(_ sender: Any) {
        let kisi = Kisiler(kisiId: 1, kisiAdi: "gül", kisiTel: "4893")
        performSegue(withIdentifier: "toDetailsVC", sender: kisi)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
    
}

