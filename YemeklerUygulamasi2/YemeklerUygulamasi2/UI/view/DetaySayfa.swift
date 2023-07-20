//
//  DetaySayfa.swift
//  YemeklerUygulamasi2
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI

struct DetaySayfa: View {
    var yemek = Yemekler()
    
    var body: some View {
        VStack(spacing:50){
            Image(yemek.yemek_resim_adi!)
            
            Text("\(yemek.yemek_fiyat!) ₺").font(.system(size: 50)).foregroundColor(.blue)
            Button("Sipariş Ver"){
                print("\(yemek.yemek_adi!)")
            }.foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(.blue)
                .cornerRadius(10)
            
        }.navigationTitle(yemek.yemek_adi!)
    }
}

struct DetaySayfa_Previews: PreviewProvider {
    static var previews: some View {
        DetaySayfa()
    }
}
