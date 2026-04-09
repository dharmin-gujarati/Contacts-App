//
//  ContentView.swift
//  ContactBook
//
//  Created by CDMI on 07/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                VStack{
                    if selectedTab == 0 {
                        DialPage()
                    }
                    else if selectedTab == 1{
                        ContactsPage()
                    }
                    else{
                        FavoritesPage()
                    }
                    
                   
                    
                    ZStack{
                        
                        HStack {
                            tabButton(icon: "phone.fill", title: "HOME", index: 0)
                            
                            Spacer()
                            
                            tabButton(icon: "person.2.fill", title: "STATISTICS", index: 1)
                            
                            Spacer()
                            
                            tabButton(icon: "star.fill", title: "SETTINGS", index: 2)
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 12)
                        .background(Color.black)
                        .shadow(radius: 10)
                    }
                    .padding(.bottom, 1)
                }
            }
        }
        
    }
    func tabButton(icon: String, title: String, index: Int) -> some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == index ? .gray : .gray.opacity(0.6))
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(selectedTab == index ? .gray : .gray.opacity(0.6))
            }
        }
    }
}

#Preview {
    ContentView()
}
