//
//  HomeViewModel.swift
//  PersonList
//
//  Created by Gül Karataş on 8.10.2024.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    var krepo = KisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init() {
        kisilerListesi = krepo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisiId:Int){
        krepo.sil(kisiId: kisiId)
    }
    func aratma(aramaKelimesi: String) {
        krepo.aratma(aramaKelimesi: aramaKelimesi)
    }
    func kisileriYukle(){
        krepo.kisileriYükle()
    }
}
