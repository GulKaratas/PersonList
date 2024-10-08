//
//  KisilerDaoRepository.swift
//  PersonList
//
//  Created by Gül Karataş on 8.10.2024.
//

import Foundation
import RxSwift

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func save(kisiAdi:String,kisiTel:String){
        print("Kişi Adı : \(kisiAdi), Kişi Telefonu : \(kisiTel)")
    }
    func güncelle(kisiAdi:String,kisiTel:String,kisiId: Int){
        print("Kişi Adı : \(kisiAdi), Kişi Telefonu : \(kisiTel), Kişi ıd : \(kisiId)")
    }
    func sil(kisiId:Int){
        print("Kişi Id : \(kisiId)")
    }
    
    func aratma(aramaKelimesi: String) {
        print("Arama Kelimesi : \(aramaKelimesi)")
    }
    
    func kisileriYükle(){
        var liste = [Kisiler]()
        let k1 = Kisiler(kisiId: 1, kisiAdi: "seren", kisiTel: "03903")
        let k2 = Kisiler(kisiId: 2, kisiAdi: "gül", kisiTel: "48948")
        let k3 = Kisiler(kisiId: 3, kisiAdi: "fırat", kisiTel: "489098")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kisilerListesi.onNext(liste)
    }
}
