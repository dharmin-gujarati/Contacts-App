import SwiftUI

struct AddContactPage: View {
    
    @State var id : String
    @State var name : String
    @State var surname : String
    @State var number : String
    @State var email : String
    @State var company : String
    @State var favorite : Bool
    @State var add : Bool
    @State var openSearch = false
    
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
                        })
                        {
                            Image(systemName: "xmark")
                                .font(.system(size: 30))
                                .foregroundColor(.gray)
                                .padding(.leading, 30)
                        }
                        Spacer()
                        if add {
                            Text("Add Contact")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }
                        else{
                            Text("Edit Contact")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }
                        Spacer()
                        Button(action:{
                            if add {
                                let user = AddContactModel(name: name, number: number, surname: surname, email: email, company: company, favorite: favorite)
                                Task{
                                    await AddContects(user)
                                }
                            }
                            else{
                                let user = AddContactModel(name: name, number: number, surname: surname, email: email, company: company, favorite: favorite)
                                Task{
                                    await editContect(user)
                                }
                            }
                            dismiss()
                        })
                        {
                            Image(systemName: "checkmark")
                                .font(.system(size: 30))
                                .foregroundColor(.gray)
                                .padding(.trailing, 30)
                        }
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
                    HStack {
                        TextField("name", text: $name)
                            .padding(10)
                            .foregroundColor(.white)
                        
                    }
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(15)
                    .padding()
                    HStack {
                        TextField("surname", text: $surname)
                            .padding(10)
                            .foregroundColor(.white)
                        
                    }
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(15)
                    .padding()
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.6))
                        .frame(height: 90)
                        .cornerRadius(15)
                        .padding()
                        .overlay{
                            VStack{
                                HStack{
                                    Text("phone")
                                        .foregroundColor(.white)
                                        .padding(.top, 25)
                                        .padding(.leading, 25)
                                    Spacer()
                                }
                                HStack {
                                    
                                    TextField("number", text: $number)
                                        .padding(10)
                                        .foregroundColor(.white)
                                }
                                .cornerRadius(15)
                                .padding(.horizontal, 20)
                                Spacer()
                            }
                        }
                    Rectangle()
                        .fill(Color.gray.opacity(0.6))
                        .frame(height: 70)
                        .cornerRadius(15)
                        .padding()
                        .overlay{
                            
                            if !openSearch{
                                HStack{
                                    Text("Location")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .padding(.leading, 25)
                                    Spacer()
                                    Button(action:{
                                        openSearch = true
                                    })
                                    {
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 25))
                                            .foregroundColor(.gray)
                                            .padding(.trailing , 25)
                                    }
                                }
                            }
                            else{
                                HStack{
                                    
                                    
                                    TextField("Search...", text: $email)
                                        .padding(10)
                                        .foregroundColor(.white)
                                        .transition(.move(edge: .trailing).combined(with: .opacity))
                                    
                                    
                                    
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
                                            .padding()
                                        
                                    }
                                }
                                .padding()
                            }
                            
                            
                            
                        }
                    Rectangle()
                        .fill(Color.gray.opacity(0.6))
                        .frame(height: 70)
                        .cornerRadius(15)
                        .padding()
                        .overlay{
                            HStack {
                                
                                TextField("number", text: $company)
                                    .padding(10)
                                    .foregroundColor(.white)
                            }
                            .cornerRadius(15)
                            .padding(.horizontal, 20)
                            Spacer()
                            
                        }
                    
                    Button(action:{
                        let user = AddContactModel(name: name, number: number, surname: surname, email: email, company: company, favorite: favorite)
                        Task{
                            await deleteContect(user)
                        }
                        
                        dismiss()
                    }) {
                        Rectangle()
                            .fill(Color.red.opacity(0.7))
                            .frame(width: 100, height: 50)
                            .cornerRadius(20)
                            .overlay{
                                Text("Delete")
                                    .foregroundColor(.white)
                            }
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func deleteContect(_ user: AddContactModel) async {
        guard let url = URL(string: "https://generateapi.techsnack.online/api/contectbook/\(id)") else { return }
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("hziNxeNzVaVq9eIp", forHTTPHeaderField: "Authorization")
            request.httpBody = try JSONEncoder().encode(user)
            
            let (data, res) = try await URLSession.shared.data(for: request)
            
            let response = res as! HTTPURLResponse
            if response.statusCode == 200 {
                print("Edit success => \(String(data: data, encoding: .utf8) ?? "no data")")
            } else {
                print("statusCode => \(response.statusCode)")
            }
            
        } catch {
            print("Request failed: \(error)")
        }
    }
    
    func editContect(_ user: AddContactModel) async {
        guard let url = URL(string: "https://generateapi.techsnack.online/api/contectbook/\(id)") else { return }
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("hziNxeNzVaVq9eIp", forHTTPHeaderField: "Authorization")
            request.httpBody = try JSONEncoder().encode(user)
            
            let (data, res) = try await URLSession.shared.data(for: request)
            
            let response = res as! HTTPURLResponse
            if response.statusCode == 200 {
                print("Edit success => \(String(data: data, encoding: .utf8) ?? "no data")")
            } else {
                print("statusCode => \(response.statusCode)")
            }
            
        } catch {
            print("Request failed: \(error)")
        }
    }
    
    func AddContects(_ user : AddContactModel) async {
        guard let url = URL(string: "https://generateapi.techsnack.online/api/contectbook") else{ return }
        
        do{
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("hziNxeNzVaVq9eIp", forHTTPHeaderField: "Authorization")
            request.httpBody = try JSONEncoder().encode(user)
            
            let (data , res) = try await URLSession.shared.data(for: request)
            
            let response = res as! HTTPURLResponse
            if response.statusCode == 200  {
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
    AddContactPage(id: "", name: "", surname: "", number: "", email: "", company: "", favorite: false, add: true)
}
