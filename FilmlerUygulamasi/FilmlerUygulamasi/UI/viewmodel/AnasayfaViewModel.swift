//
//  AnasayfaViewModel.swift
//  FilmlerUygulamasi
//
//  Created by Efe Soydas on 13.07.2023.
//

import Foundation
class AnasayfaViewModel : ObservableObject {
    @Published var kategorilerListesi = [Kategoriler]()
    
    let db:FMDatabase?
    
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!//db lerin kaydedildiği genel dosya yoludur bu
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        db = FMDatabase(path: hedefYol.path)
        
    }
    
    
    
    
    
    func kategorilerYukle(){
       /*
        var liste = [Kategoriler]()
        let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Aksiyon")
        let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Drama")
        let k3 = Kategoriler(kategori_id: 3, kategori_ad: "Bilim Kurgu")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kategorilerListesi = liste
        */
        db?.open()
        
        var liste =  [Kategoriler]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kategoriler", values: nil)
            while result.next(){
                let kategori_id = Int(result.string(forColumn: "kategori_id"))!
                let kategori_ad = result.string(forColumn: "kategori_ad")!
                let kategori = Kategoriler(kategori_id: kategori_id, kategori_ad: kategori_ad)
                liste.append(kategori)
                
            }
            kategorilerListesi = liste 
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
}
