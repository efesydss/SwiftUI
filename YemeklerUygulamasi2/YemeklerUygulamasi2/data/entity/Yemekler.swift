//
//  Yemekler.swift
//  YemeklerUygulamasi2
//
//  Created by Efe Soydas on 8.07.2023.
//

import Foundation
class Yemekler : Identifiable{
    var yemek_id:Int?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:Int?
    
    init(yemek_id: Int? = nil, yemek_adi: String? = nil, yemek_resim_adi: String? = nil, yemek_fiyat: Int? = nil) {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
    }
    init(){
        
    }
    
}
