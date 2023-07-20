//
//  KisiDetayViewModel.swift
//  KisilerUygulaması
//
//  Created by Efe Soydas on 9.07.2023.
//

import Foundation
class KisiDetayViewModel: ObservableObject{
    let db:FMDatabase?
    init(){
        let veritabanıYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
        let hedefYol = URL(fileURLWithPath: veritabanıYolu).appendingPathComponent("rehber22.db")
        db = FMDatabase.init(path: hedefYol.path)
    }
    func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ? , kisi_tel = ? WHERE kisi_id = ?",values: [kisi_ad,kisi_tel,kisi_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
