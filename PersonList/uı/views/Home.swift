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
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        _ = viewModel.kisilerListesi.subscribe(onNext: { liste in
            self.kisilerListesi = liste
            self.kisilerTableView.reloadData()
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.kisileriYukle()
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
        viewModel.aratma(aramaKelimesi: searchText)
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
                self.viewModel.sil(kisiId: kisi.kisiId!)
                
            }
            alert.addAction(silAction)
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
