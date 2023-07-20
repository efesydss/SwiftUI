//
//  Filmler.swift
//  FilmlerUygulamasi
//
//  Created by Efe Soydas on 8.07.2023.
//

import Foundation
class Filmler : Identifiable{
    var film_id:Int?
    var film_adi:String?
    var film_yil:Int?
    var film_resim:String?
    var kategori:Kategoriler?
    var yonetmen:Yonetmenler?
    
    init(film_id: Int, film_adi: String, film_yil: Int, film_resim: String, kategori: Kategoriler, yonetmen: Yonetmenler) {
        self.film_id = film_id
        self.film_adi = film_adi
        self.film_yil = film_yil
        self.film_resim = film_resim
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
    init(){}
}
