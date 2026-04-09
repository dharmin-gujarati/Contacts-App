//
//  ContactDetailsPage.swift
//  ContactBook
//
//  Created by CDMI on 07/04/26.
//

import SwiftUI

struct ContactDetailsPage: View {
    
    @State var id : String
    @State var favorite : Bool
    @State var name : String
    @State var surname : String
    @State var number : String
    @State var email : String
    @State var company : String
    @State var goEditPage = false
    
    
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
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                        
                        Text("Contect name (read only)")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        Spacer()
                        Button(action:{
                            
                        }) {
                            Image(systemName: "star")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        Button(action:{
                            goEditPage = true
                        }) {
                            Image(systemName: "square.and.pencil.circle")
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                        }
                        Button(action:{
                            
                        })
                        {
                            VStack{
                                Image(systemName: "circle")
                                    .bold()
                                    .font(.system(size: 10))
                                    .foregroundColor(.white)
                                Image(systemName: "circle")
                                    .bold()
                                    .font(.system(size: 10))
                                    .foregroundColor(.white)
                            }
                            
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
                    
                    Text("\(name)\(surname)")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                    
                    Text("\(email)")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 90)
                        .cornerRadius(15)
                        .padding()
                        .overlay{
                            
                            HStack{
                                VStack{
                                    Text("\(number)")
                                        .foregroundColor(.white)
                                    Text("Location")
                                        .foregroundColor(.gray)
                                }
                                .padding(.leading , 20)
                                Spacer()
                                
                                Button(action:{
                                    
                                }) {
                                    Circle()
                                        .fill(Color.gray.opacity(0.6))
                                        .frame(height: 40)
                                        .cornerRadius(15)
                                        .overlay{
                                            Image(systemName: "phone")
                                                .foregroundColor(.white)
                                        }
                                }
                                Button(action:{
                                    
                                }) {
                                    Circle()
                                        .fill(Color.gray.opacity(0.6))
                                        .frame(height: 40)
                                        .cornerRadius(15)
                                        .overlay{
                                            Image(systemName: "video")
                                                .foregroundColor(.white)
                                        }
                                }
                                Button(action:{
                                    
                                }) {
                                    Circle()
                                        .fill(Color.gray.opacity(0.6))
                                        .frame(height: 40)
                                        .cornerRadius(15)
                                        .overlay{
                                            Image(systemName: "message")
                                                .foregroundColor(.white)
                                        }
                                }
                                .padding(.trailing , 20)
                            }
                        }
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 80)
                        .cornerRadius(15)
                        .padding()
                        .overlay{
                            VStack(spacing:10){
                                HStack{
                                    Text("Company")
                                        .foregroundColor(.white)
                                        .padding(.leading, 25)
                                    
                                    
                                    Spacer()
                                }
                                HStack{
                                    Text("\(company)")
                                        .foregroundColor(.white)
                                        .padding(.leading, 25)
                                    
                                    Spacer()
                                }
                                
                               
                            }
                            
                        }
                    
                    
                    
                    Spacer()
                }
               
            }
            .navigationDestination(isPresented: $goEditPage) {
                AddContactPage(id: id, name: name, surname: surname, number: number, email: email, company: company, favorite: favorite, add: false)
            }
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    ContactDetailsPage(id: "", favorite: false, name: "11111", surname: "11111", number: "11111", email: "11111", company: "11111")
}
