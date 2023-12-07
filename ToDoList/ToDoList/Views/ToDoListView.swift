//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    //a query that'll continuously listen for items.
    
    init(userId: String){
        //users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        //the underscore is used for convention for property wrappers "@"
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Dooo List")
            .toolbar{
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 25))
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(NewItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "UPUBB0447DgswmFLxcZ2LTXDtqc2")
}
