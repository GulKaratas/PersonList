//
//  KisiDetayViewModel.swift
//  PersonList
//
//  Created by Gül Karataş on 8.10.2024.
//

import Foundation

class KisiDetayViewModel {
    
    var krepo = KisilerDaoRepository()
    
    func güncelle(kisiAdi:String,kisiTel:String,kisi: KisilerModel){
        krepo.güncelle(kisiAdi: kisiAdi, kisiTel: kisiTel, kisi: kisi)
    }
}
