//
//  Kategoriler.swift
//  FilmlerUygulamasi
//
//  Created by Efe Soydas on 8.07.2023.
//

import Foundation
class Kategoriler : Identifiable{
    var kategori_id:Int?
    var kategori_ad:String?
    
    init(kategori_id: Int? = nil, kategori_ad: String? = nil) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
    init(){
        
    }
}
    

