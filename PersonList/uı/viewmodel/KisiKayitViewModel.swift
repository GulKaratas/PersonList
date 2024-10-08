//
//  KisiKayitViewModel.swift
//  PersonList
//
//  Created by Gül Karataş on 8.10.2024.
//

import Foundation

class KisiKayitViewModel {
    
    var krepo = KisilerDaoRepository()
    
    func save(kisiAdi:String,kisiTel:String){
        krepo.save(kisiAdi: kisiAdi, kisiTel: kisiTel)
    }
}
