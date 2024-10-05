//
//  ViewController.swift
//  PersonList
//
//  Created by Gül Karataş on 28.09.2024.
//

import UIKit

class Home: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisiId: 1, kisiAdi: "seren", kisiTel: "03903")
        let k2 = Kisiler(kisiId: 2, kisiAdi: "gül", kisiTel: "48948")
        let k3 = Kisiler(kisiId: 3, kisiAdi: "fırat", kisiTel: "489098")
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya dönüldü")
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

extension Home: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişiler : \(searchText)")
    }
}
extension Home: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHücre", for: indexPath) as! KisilerHucre
        
        hucre.labelKisiAd.text = kisi.kisiAdi
        hucre.labelKisiTel.text = kisi.kisiTel
        
        return hucre
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (action, sourceView, completionHandler) in
            let kisi = self.kisilerListesi[indexPath.row]

            let alert = UIAlertController(title: "Silme", message: "\(kisi.kisiAdi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
            alert.addAction(iptalAction)
            let silAction = UIAlertAction(title: "Sil", style: .destructive) { action in
                print("Kisi Sil : \(kisi.kisiAdi!)")
                
            }
            alert.addAction(silAction)
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
