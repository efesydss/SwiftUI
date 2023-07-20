//
//  Yonetmenler.swift
//  FilmlerUygulamasi
//
//  Created by Efe Soydas on 8.07.2023.
//

import Foundation
class Yonetmenler : Identifiable{
    var yonetmen_id:Int?
    var yonetmen_ad:String?
    
    init(yonetmen_id: Int? = nil, yonetmen_ad: String? = nil) {
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
    
    init(){
        
    }
}
