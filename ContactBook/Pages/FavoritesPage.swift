//
//  FavoritesPage.swift
//  ContactBook
//
//  Created by CDMI on 07/04/26.
//

import SwiftUI

struct FavoritesPage: View {
    var body: some View {
        VStack{
            HStack{
                Text("Dile")
                    .bold()
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                Button(action:{
                    
                })
                {
                    Image(systemName: "checkmark.square")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.trailing)
            }
            Spacer()
        }
    }
}

#Preview {
    FavoritesPage()
}

