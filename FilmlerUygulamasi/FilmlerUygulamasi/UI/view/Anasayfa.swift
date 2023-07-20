//
//  Anasayfa.swift
//  FilmlerUygulamasi
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI

struct Anasayfa: View {
    
    @ObservedObject var viewModel = AnasayfaViewModel()
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.kategorilerListesi){kategori in
                    NavigationLink(destination: FilmSayfa(kategori:kategori)){
                        KategoriItem(kategori: kategori)
                    }
                }
            }.navigationTitle("Kategoriler")
                .onAppear{
                    veritabaniKopyala()
                    viewModel.kategorilerYukle()
                }
        }
    }
    func veritabaniKopyala(){
        
        /*
         let bundle = Bundle.main.path(forResource: "rehber22", ofType: ".db")
         let veritabanıYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
         let hedefYol = URL(fileURLWithPath: veritabanıYolu).appendingPathComponent("rehber22.db")
         let fm = FileManager.default
         if fm.fileExists(atPath: hedefYol.path){
             //veritabanı mevcut
             print("veritabanı kopyalandı")
         */
        let bundle = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!//db lerin kaydedildiği genel dosya yoludur bu
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: hedefYol.path){
            print("Veritabanı Daha Önce Kopylandı")
        }else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
                //try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
    
}

struct Anasayfa_Previews: PreviewProvider {
    static var previews: some View {
        Anasayfa()
    }
}
