//
//  KisilerDaoRepository.swift
//  PersonList
//
//  Created by Gül Karataş on 8.10.2024.
//

import Foundation
import RxSwift

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    var context = appDelegate.persistentContainer.viewContext
    
    func save(kisiAdi:String,kisiTel:String){
        let kisi = KisilerModel(context: context)
        kisi.kisiAdi = kisiAdi
        kisi.kisiTel = kisiTel
        
        appDelegate.saveContext()
    }
    func güncelle(kisiAdi:String,kisiTel:String,kisi: KisilerModel){
        kisi.kisiAdi = kisiAdi
        kisi.kisiTel = kisiTel
        
        appDelegate.saveContext()
    }
    func sil(kisi: KisilerModel) {
        context.delete(kisi)
        appDelegate.saveContext()
        kisileriYükle()
    }
    
    func aratma(aramaKelimesi: String) {
        do {
            let fr = KisilerModel.fetchRequest()
            fr.predicate = NSPredicate(format: "kisiAdi CONTAINS[c] %@", aramaKelimesi)
            let liste = try context.fetch(fr)
            kisilerListesi.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func kisileriYükle(){
        do {
            let liste = try context.fetch(KisilerModel.fetchRequest())
            kisilerListesi.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
    }
}
