//
//  FilmSayfaViewModel.swift
//  FilmlerUygulamasi
//
//  Created by Efe Soydas on 13.07.2023.
//

import Foundation
class FilmSayfaViewModel : ObservableObject {
    @Published var filmlerListesi = [Filmler]()
    let db:FMDatabase?
    
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!//db lerin kaydedildiği genel dosya yoludur bu
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        db = FMDatabase(path: hedefYol.path)
        
    }
    
    func filmlerYukle(kategori_id:Int){
        /*
        var liste = [Filmler]()
        let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Aksiyon")
        let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Drama")
        let k3 = Kategoriler(kategori_id: 3, kategori_ad: "Bilim Kurgu")
        let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Quentin Tarantino")
        let y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Christopher Nolan")
        let y3 = Yonetmenler(yonetmen_id: 3, yonetmen_ad: "Nuri Bilge Ceylan")
        let y4 = Yonetmenler(yonetmen_id: 4, yonetmen_ad: "Roman Polanski")
        
      
        
        let f1 = Filmler(film_id: 1, film_adi: "Django", film_yil: 2014, film_resim: "django", kategori: k1, yonetmen: y1)
        let f2 = Filmler(film_id: 2, film_adi: "Interstellar", film_yil: 2015, film_resim: "interstellar", kategori: k3, yonetmen: y2)
        let f3 = Filmler(film_id: 3, film_adi: "Inception", film_yil: 2010, film_resim: "inception", kategori: k3, yonetmen: y2)
        let f4 = Filmler(film_id: 4, film_adi: "Anadoluda", film_yil: 2011, film_resim: "birzamanlaranadoluda", kategori: k2, yonetmen: y3)
        let f5 = Filmler(film_id: 5, film_adi: "The Pianist", film_yil: 2008, film_resim: "thepianist", kategori: k2, yonetmen: y4)
        let f6 = Filmler(film_id: 6, film_adi: "The Hateful Eight", film_yil: 2017, film_resim: "thehatefuleight", kategori: k1, yonetmen: y4)
        liste.append(f1)
        liste.append(f2)
        liste.append(f3)
        liste.append(f4)
        liste.append(f5)
        liste.append(f6)
       
        //econun programında burada metotdan parametre olarak tarih iste aşağıda tarihe göre filtrele ve finalListeyi arayüze gönder
        let finalListe = liste.filter({
            $0.kategori!.kategori_id == kategori_id
        })
        
        filmlerListesi = finalListe
         */
        
        
        db?.open()
        
        var liste =  [Filmler]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kategoriler, yonetmenler, filmler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = ? ", values: [kategori_id])
            
            while result.next(){
               
                let kategori_id = Int(result.string(forColumn: "kategori_id"))!
                let kategori_ad = result.string(forColumn: "kategori_ad")!
                
                let kategori = Kategoriler(kategori_id: kategori_id, kategori_ad: kategori_ad)
                
                let yonetmen_id = Int(result.string(forColumn: "yonetmen_id"))!
                let yonetmen_ad = result.string(forColumn: "yonetmen_ad")!
                
                let yonetmen = Yonetmenler(yonetmen_id:yonetmen_id,yonetmen_ad: yonetmen_ad)
                
                let film_id = Int(result.string(forColumn: "film_id"))!
                let film_ad = result.string(forColumn: "film_ad")!
                let film_yil = Int(result.string(forColumn: "film_yil"))!
                let film_resim = result.string(forColumn: "film_resim")!
                
                let film = Filmler(film_id: film_id, film_adi: film_ad, film_yil: film_yil, film_resim: film_resim, kategori: kategori, yonetmen: yonetmen)
                
                liste.append(film)
                
                
            }
            
            filmlerListesi = liste
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()

    }
    
}
