//
//  ContentView.swift
//  KisilerUygulaması
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI

struct Anasayfa: View {
   
    @State private var aramaKelimesi = ""
    //bu sayfa veri ile besleniyorsa örn db den gelen verilerle ui doluyorsa mutlaka obserable object gereklidir...
    @ObservedObject var viewModel = AnasayfaViewModel()//çünkü veri gelecek state gibi online dinleyecez ya ondan
    
    func sil(at offsets: IndexSet){
        let kisi = viewModel.kisilerListesi[offsets.first!]
        
        viewModel.sil(kisi_id: kisi.kisi_id!)
    }
    var body: some View {
        
        NavigationStack{
            List(){
                ForEach(viewModel.kisilerListesi){kisi in
                    NavigationLink(destination: KisiDetaySayfa(kisi: kisi)){
                        KisilerSatir(kisi:kisi)
                        
                    }
                    
                }.onDelete(perform: sil)
            }.navigationTitle("Contact")
                .toolbar(){
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination:KisiKayitSayfa()){
                            Image(systemName: "plus")
                        }
                    }
                }.onAppear{
                   
                    veritabaniKopyala()
                    viewModel.kisileriYukle()//observable !!
                   
                }
        }.searchable(text: $aramaKelimesi, prompt: "Search")
            .onChange(of: aramaKelimesi){s in
                viewModel.ara(aramaKelimesi: s)
            }
            
        
    }
    func veritabaniKopyala(){
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
