//
//  Kisiler.swift
//  PersonList
//
//  Created by Gül Karataş on 30.09.2024.
//

import Foundation

class Kisiler {
    
    var kisiId : Int?
    var kisiAdi: String?
    var kisiTel: String?
    
    init () {
        
    }
    
    init(kisiId: Int, kisiAdi: String, kisiTel: String) {
        self.kisiId = kisiId
        self.kisiAdi = kisiAdi
        self.kisiTel = kisiTel
    }
}
