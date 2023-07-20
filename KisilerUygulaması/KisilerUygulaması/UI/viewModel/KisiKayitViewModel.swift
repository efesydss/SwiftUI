//
//  KisiKayitViewModel.swift
//  KisilerUygulaması
//
//  Created by Efe Soydas on 9.07.2023.
//

import Foundation
class KisiKayitViewModel: ObservableObject{
    let db:FMDatabase?
    init(){
        let veritabanıYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
        let hedefYol = URL(fileURLWithPath: veritabanıYolu).appendingPathComponent("rehber22.db")
        db = FMDatabase.init(path: hedefYol.path)
    }
    func kaydet(kisi_ad:String,kisi_tel:String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)",values: [kisi_ad,kisi_tel])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
