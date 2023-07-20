//
//  YemekSatir.swift
//  YemeklerUygulamasi2
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI

struct YemekSatir: View {
    var yemek = Yemekler()
    
    var body: some View {
        HStack{
            Image(yemek.yemek_resim_adi!).resizable().frame(width: 100, height: 100)
            VStack{
                Text(yemek.yemek_adi!)
                Text("\(yemek.yemek_fiyat!) ₺").foregroundColor(.blue)
            }
        }
    }
}


