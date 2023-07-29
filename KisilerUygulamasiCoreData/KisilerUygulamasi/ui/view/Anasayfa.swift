//
//  ContentView.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 17.02.2023.
//

import SwiftUI

struct Anasayfa: View {
    @State private var aramaKelimesi = ""
    
    @ObservedObject var viewModel = AnasayfaViewModel()
    
    func sil(at offsets:IndexSet){
        let kisi = viewModel.kisilerListesi[offsets.first!]
        viewModel.kisilerListesi.remove(at: offsets.first!)
        viewModel.sil(kisi: kisi)
    }
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.kisilerListesi){ kisi in
                    NavigationLink(destination: KisiDetaySayfa(kisi: kisi,kisilerListesi: $viewModel.kisilerListesi)){
                        KisilerSatir(kisi: kisi)
                    }
                }.onDelete(perform: sil)
            }.navigationTitle("Kişiler")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: KisiKayitSayfa()){
                            Image(systemName: "plus")
                        }
                    }
                }.onAppear{
                    
                    viewModel.kisileriYukle()
                    print("Anasayfaya dönüldü")
                }
        }.searchable(text: $aramaKelimesi, prompt: "Ara")
            .onChange(of: aramaKelimesi){ s in
                viewModel.ara(aramaKelimesi: s)
                if s == ""{
                    viewModel.kisileriYukle()
                }else{
                    viewModel.ara(aramaKelimesi: s)
                }
            }
    }
}

struct Anasayfa_Previews: PreviewProvider {
    static var previews: some View {
        Anasayfa()
    }
}
