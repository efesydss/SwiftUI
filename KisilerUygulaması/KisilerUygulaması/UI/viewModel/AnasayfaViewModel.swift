//
//  AnasayfaViewModel.swift
//  KisilerUygulaması
//
//  Created by Efe Soydas on 9.07.2023.
//

import Foundation
class AnasayfaViewModel: ObservableObject{//dbden gelen veriler view e gidiyosa gerekli
    @Published var kisilerListesi = [Kisiler]()
    let db:FMDatabase?
    init(){
        let veritabanıYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
        let hedefYol = URL(fileURLWithPath: veritabanıYolu).appendingPathComponent("rehber22.db")
        db = FMDatabase.init(path: hedefYol.path)
    }
    func kisileriYukle(){
        //dbden geliyor gibii...
        /*
        var liste = [Kisiler]()
        let k1 = Kisiler(kisi_id: 1,kisi_ad: "John Doe",kisi_tel: "0101010101")
        let k2 = Kisiler(kisi_id: 2,kisi_ad: "Steve Jobs",kisi_tel: "02020202")
        let k3 = Kisiler(kisi_id: 3,kisi_ad: "Steve Vozniak",kisi_tel: "03030303")
        let k4 = Kisiler(kisi_id: 4,kisi_ad: "Hawlett Packard",kisi_tel: "04040404")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        liste.append(k4)
         */
       
        db?.open()
        var liste = [Kisiler]()
        
        do{
            let result = try db!.executeQuery("Select * from kisiler",values: nil)
            while result.next(){
                let kisi_id = Int(result.string(forColumn: "kisi_id"))!
                let kisi_ad = result.string(forColumn: "kisi_ad")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                let kisi = Kisiler(kisi_id: kisi_id,kisi_ad: kisi_ad,kisi_tel: kisi_tel)
                liste.append(kisi)
                
                print("---------------")
                print("-\(kisi_id) \(kisi_ad) \(kisi_tel)")
            }
            kisilerListesi = liste
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        
       
        //kisilerListesi = liste//bu değiştiği anda yukarıda published sayesinde arayüzdede güncellenir state in daha global hali
    }
    
    func ara(aramaKelimesi:String){
        db?.open()
        var liste = [Kisiler]()
        do{
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like ?", values: ["%\(aramaKelimesi)%"])
            while result.next() {
                let kisi_id = Int(result.string(forColumn: "kisi_id"))
                let kisi_ad = result.string(forColumn: "kisi_ad")
                let kisi_tel = result.string(forColumn: "kisi_tel")
                
                let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                liste.append(kisi)
                
            }
            kisilerListesi = liste
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        
        
    }
    func sil(kisi_id:Int){
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?",values: [kisi_id])
            kisileriYukle()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
}
