//
//  EditContactPage.swift
//  ContactBook
//
//  Created by CDMI on 08/04/26.
//

import SwiftUI

struct EditContactPage: View {
    @State var favorite : Bool
    @State var name : String
    @State var surname : String
    @State var number : String
    @State var email : String
    @State var company : String
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Button(action:{
                            dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                        Spacer()
                        Text("Edit Contect")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        Spacer()
                        Button(action:{
                            
                        }) {
                            Image(systemName: "checkmark")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                        
                        .padding(.trailing)
                    }
                    ZStack{
                        Image(systemName: "circle.fill")
                            .font(.system(size: 150))
                            .foregroundColor(.gray.opacity(0.5))
                        
                        Image(systemName: "person.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.black.opacity(0.5))
                    }
                    .padding()
                    
                    
                    
                    
                    
                    Spacer()
                }
                
            }
        }
    }
}


#Preview {
    EditContactPage(favorite: false, name: "11111", surname: "11111", number: "11111", email: "11111", company: "11111")
}
