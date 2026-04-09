//
//  DialPage.swift
//  ContactBook
//
//  Created by CDMI on 07/04/26.
//

import SwiftUI

struct DialPage: View {
    @State private var openSearch = false
    @State private var search = ""
    var body: some View {
        VStack{
            if !openSearch{
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
                    
                    Button(action:{
                        openSearch = true
                    })
                    {
                        Image(systemName: "magnifyingglass")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                    
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
            }
            else{
                HStack{
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading,10)
                        
                        TextField("Search...", text: $search)
                            .padding(10)
                            .foregroundColor(.white)
                            .transition(.move(edge: .trailing).combined(with: .opacity))
                        
                    }
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(15)
                    Button(action:{
                        withAnimation(.easeInOut) {
                            openSearch.toggle()
                        }
                    })
                    {
                        
                        Text("cancel")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                        
                    }
                }
                .padding()
            }
            ScrollView{
                ForEach(0..<20){ i in
                    Rectangle()
                        .frame(height: 80)
                        .overlay{
                            HStack{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 40))
                                    .padding()
                                VStack(alignment: .leading){
                                    Text("sg sfdg ret")
                                        .foregroundColor(.white)
                                    Text("+91 32145 69871")
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                Text("6 Apr")
                                    .foregroundColor(.white)
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                            }
                            
                        }
                    Divider()
                        .frame(width: 380)
                }
            }
            
            
            Spacer()
        }
    }
}

#Preview {
    DialPage()
}

