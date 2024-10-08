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
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    init() {
        kisilerListesi = krepo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisi: KisilerModel){
        krepo.sil(kisi: kisi)
    }
    func aratma(aramaKelimesi: String) {
        krepo.aratma(aramaKelimesi: aramaKelimesi)
    }
    func kisileriYukle(){
        krepo.kisileriYükle()
    }
}
