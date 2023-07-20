//
//  KisiKayitSayfa.swift
//  KisilerUygulaması
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI

struct KisiKayitSayfa: View {
    @State private var tfKisiAd = ""
    @State private var tfKisiTel = ""
    var ViewModel = KisiKayitViewModel()
    
    //Eğer arayüze veri aktarmak gerekiyorsa Observed Object kullan yoksa gerek yok sadece viewModel yeterli
    func kaydet(kisi_ad:String,kisi_tel:String){
        print("Kaydet \(kisi_ad) - \(kisi_tel)")
    }

    var body: some View {
        VStack(spacing:100){
            
            TextField("Kişi Ad",text: $tfKisiAd)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Kişi Tel",text: $tfKisiTel)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Kaydet"){
                ViewModel.kaydet(kisi_ad: tfKisiAd, kisi_tel: tfKisiTel)
            }
            
        }.navigationTitle("Kişi Kayıt")
    }
}

struct KisiKayitSayfa_Previews: PreviewProvider {
    static var previews: some View {
        KisiKayitSayfa()
    }
}
