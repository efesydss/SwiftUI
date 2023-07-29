//
//  KisilerUygulamasiApp.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 17.02.2023.
//

import SwiftUI
import CoreData


@main
struct KisilerUygulamasiApp: App {
    var body: some Scene {
        WindowGroup {
            Anasayfa()
        }
    }
}

// MARK: - Core Data stack
//bu kodları şöyle aldım: Yeni proje oluştur storyboard seç use core data seçme, sonra açılan projeden App Delegate dosyasında en alttan iki code bloğunu al buraya yapıştı aşağıda "Model" yazısnı da bu projede oluşturduğun Veritabanı adı yap tamam bide lazy yazıyosa sil onu
 var persistentContainer: NSPersistentContainer = {
   //Database Access Code
    let container = NSPersistentContainer(name: "Model")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

// MARK: - Core Data Saving support

func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
           
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
