//
//  KisiDetaySayfa.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 17.02.2023.
//

import SwiftUI

struct KisiDetaySayfa: View {
    @State private var tfKisiAd = ""
    @State private var tfKisiTel = ""
    
    var kisi = KisilerModel()
    
   @Binding var kisilerListesi:[KisilerModel]
    
    var viewModel = KisiDetayViewModel()
    
    var body: some View {
        VStack(spacing: 100){
            TextField("Kişi Ad",text: $tfKisiAd)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Kişi Tel",text: $tfKisiTel)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("GÜNCELLE"){
                viewModel.guncelle(kisi: kisi, kisi_ad: tfKisiAd, kisi_tel: tfKisiTel)
                
                kisilerListesi.removeAll()//anasayfayı temizler yoksa güncel hali görünmez
                
            }
        }.navigationTitle("Kişi Detay")
            .onAppear{
                tfKisiAd = kisi.kisi_ad!
                tfKisiTel = kisi.kisi_tel!
            }
    }
}
/*
 struct KisiDetaySayfa_Previews: PreviewProvider {
 static var previews: some View {
 KisiDetaySayfa()
 }
 }
 */
