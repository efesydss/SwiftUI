//
//  ContentView.swift
//  YemeklerUygulamasi2
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI

struct Anasayfa: View {
    
    @ObservedObject var viewModel = AnasayfaViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.yemeklerListesi){yemek in
                    NavigationLink(destination:DetaySayfa(yemek:yemek)){
                        YemekSatir(yemek:yemek)
                    }
                    
                    
                    
                }
            }.navigationTitle("Yemekler")
                .onAppear{
                    veritabanıKopyala()
                    viewModel.yemekleriYukle()//vm db den alır published listeye yükler verileri bizde bu sayfada vm.liste diyerek almış oluyoruz foreachde ve burada..
                    
                }
        }
    }
    
    func veritabanıKopyala(){
        
        
        /*
         let bundle = Bundle.main.path(forResource: "rehber22", ofType: ".db")
         let veritabanıYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
         let hedefYol = URL(fileURLWithPath: veritabanıYolu).appendingPathComponent("rehber22.db")
         let fm = FileManager.default
         if fm.fileExists(atPath: hedefYol.path){
             //veritabanı mevcut
             print("veritabanı kopyalandı")
         }else{
             do{
                 try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
         */
        
        
        
        let bundle = Bundle.main.path(forResource: "yemekler", ofType: ".sqlite")
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("yemekler.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path) {
            print("Veritabanı Daha Önce kopyalandı.")
        }else {
            
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
                
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
