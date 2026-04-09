//
//  ContactsPage.swift
//  ContactBook
//
//  Created by CDMI on 07/04/26.
//

import SwiftUI

struct ContactsPage: View {
    @State var search = ""
    @State var goAddContact = false
    @State var goContactDetails = false
    
    @State var list : [Datum] = []
    @State var data : Datum?
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Contacts")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 30))
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
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading,10)
                    
                    TextField("Search...", text: $search)
                        .padding(10)
                        .foregroundColor(.white)
                }
                .background(Color.gray.opacity(0.6))
                .cornerRadius(15)
                
                Spacer()
                ZStack{
                    ScrollView{
                        VStack{
                            ForEach(list, id: \.self) { i in
                                Button(action:{
                                    print("\(i.id)")
                                    
                                    data = i
                                })
                                {
                                    Rectangle()
                                        .fill(.black)
                                        .frame(height: 80)
                                        .overlay{
                                            HStack{
                                                Image(systemName: "person.circle.fill")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 40))
                                                    .padding()
                                                VStack(alignment: .leading){
                                                    Text("\(i.name)")
                                                        .foregroundColor(.white)
                                                    Text("\(i.number)")
                                                        .foregroundColor(.white)
                                                }
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.gray)
                                                    .padding(.trailing)
                                            }
                                            
                                        }
                                }
                                
                                Divider()
                                    .frame(width: 380)
                            }
                        }
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                goAddContact = true
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(.gray)
                            }
                            
                            .padding()
                        }
                    }
                }
                .navigationDestination(item: $data) { i in
                    ContactDetailsPage(
                        id: i.id,
                        favorite: i.favorite,
                        name: i.name,
                        surname: i.surname,
                        number: i.number,
                        email: i.email,
                        company: i.company
                    )
                }
                .navigationDestination(isPresented: $goAddContact) {
                    AddContactPage(id: "", name: "", surname: "", number: "", email: "", company: "", favorite: false, add: true)
                }
                Spacer()
                
                
            }
            .onAppear {
                Task {
                    await fetchContact()
                }
            }
            
        }
        
        
    }
    func fetchContact() async {
        guard let url = URL(string: "https://generateapi.techsnack.online/api/contectbook") else {return}
        
        do{
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("hziNxeNzVaVq9eIp", forHTTPHeaderField: "Authorization")
            
            let (data , res) = try await URLSession.shared.data(for: request)
            
            let response = res as! HTTPURLResponse
            if response.statusCode == 200  {
                
                let userDataModel = try JSONDecoder().decode(UserDataModel.self, from: data)
                list = userDataModel.data
                print("successful => \(String(data: data, encoding: .utf8) ?? "no data")")
                
            }
            else
            {
                print("statusCode => \(response.statusCode)")
            }
            
        }
        catch{
            print("Request failed: \(error)")
        }
    }
}

#Preview {
    ContactsPage()
}

