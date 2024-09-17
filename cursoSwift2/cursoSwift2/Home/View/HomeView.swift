//
//  HomeView.swift
//  cursoSwift2
//
//  Created by user250318 on 9/13/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: UserViewModel
    @State private var isPresentNewPost = false
    @State private var title = ""
    @State private var itemToDelete: User? = nil
    @State private var showingDeleteConfirmation = false
    
    var body: some View {
        
        NavigationView {
            
            Group {
                
                if viewModel.users.isEmpty {
                    
                    Text("No items")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                }else {
                    
                    List {
                        
                        ForEach(viewModel.users, id: \.id) { item in
                        
                            VStack(alignment: .leading) {
                                
                                Text(item.name)
                            }
                            .swipeActions(edge: .trailing) {
                                
                                Button(role: .destructive) {
                                    
                                    itemToDelete = item
                                    showingDeleteConfirmation = true
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .listStyle(InsetListStyle())
                }
                    
            }
            .navigationBarTitle("User List")
            .navigationBarItems(trailing: plusButton)
            .sheet(isPresented: $isPresentNewPost){
                
                NewItemView(isPresented: $isPresentNewPost, title: $title)
            }
            .alert(isPresented: $showingDeleteConfirmation) {
                
                Alert(
                
                    title: Text("Are you sure?"),
                    message: Text("Do you want to remove this item?"),
                    primaryButton: .destructive(Text("Delete")) {
                        
                        if let item = itemToDelete {
                            
                            viewModel.deleteUser(user: item)
                        }
                    },
                    secondaryButton: .cancel()
                )
                
            }
        }
        
    }
    
    var plusButton: some View {
        
        Button(action: {
            isPresentNewPost.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
    
}

