//
//  KisiDetayViewModel.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 19.02.2023.
//

import Foundation
import CoreData

class KisiDetayViewModel {
    //let context = persistentContainer.viewContext // gerek yokmuş
    
    func guncelle(kisi:KisilerModel,kisi_ad:String,kisi_tel:String){
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        saveContext()
    }
}
