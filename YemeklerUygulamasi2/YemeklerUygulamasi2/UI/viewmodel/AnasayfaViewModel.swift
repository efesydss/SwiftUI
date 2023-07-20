//
//  AnasayfaViewModel.swift
//  YemeklerUygulamasi2
//
//  Created by Efe Soydas on 13.07.2023.
//

import Foundation
class AnasayfaViewModel : ObservableObject{
    @Published var yemeklerListesi = [Yemekler]()
    
    let db: FMDatabase?
    
    init(){
        /*
         let veritabanıYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
         let hedefYol = URL(fileURLWithPath: veritabanıYolu).appendingPathComponent("rehber22.db")
         db = FMDatabase.init(path: hedefYol.path)
         */
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("yemekler.sqlite")
        db = FMDatabase(path: hedefYol.path)
        
    }
    
    
    func yemekleriYukle(){
        /*
        var liste = [Yemekler]()
        let y1 = Yemekler(yemek_id: 1, yemek_adi: "Ayran", yemek_resim_adi: "ayran", yemek_fiyat: 8)
        let y2 = Yemekler(yemek_id: 2, yemek_adi: "Baklava", yemek_resim_adi: "baklava", yemek_fiyat: 70)
        let y3 = Yemekler(yemek_id: 3, yemek_adi: "Fanta", yemek_resim_adi: "fanta", yemek_fiyat: 10)
        let y4 = Yemekler(yemek_id: 4, yemek_adi: "Kadayif", yemek_resim_adi: "kadayif", yemek_fiyat: 50)
        let y5 = Yemekler(yemek_id: 5, yemek_adi: "Köfte", yemek_resim_adi: "kofte", yemek_fiyat: 60)
        let y6 = Yemekler(yemek_id: 6, yemek_adi: "Makarna", yemek_resim_adi: "makarna", yemek_fiyat: 55)
        
        liste.append(y1)
        liste.append(y2)
        liste.append(y3)
        liste.append(y4)
        liste.append(y5)
        liste.append(y6)
         yemeklerListesi = liste
         */
        
       
        db?.open()
        
        var liste = [Yemekler]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM yemekler", values: nil)
            while result.next() {
                let yemek_id = Int(result.string(forColumn: "yemek_id"))!
                let yemek_adi = result.string(forColumn: "yemek_adi")!

                let yemek_resim_adi = result.string(forColumn: "yemek_resim_adi")!
                let yemek_fiyat = Int(result.string(forColumn: "yemek_fiyat"))!
                
                let yemek = Yemekler(yemek_id: yemek_id, yemek_adi: yemek_adi,yemek_resim_adi: yemek_resim_adi,yemek_fiyat: yemek_fiyat)
                liste.append(yemek)
                
                

                
                
            }
            yemeklerListesi = liste
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        
    }
}
