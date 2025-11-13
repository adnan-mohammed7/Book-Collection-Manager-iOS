//
//  BookListView.swift
//  Assignment-3
//
//  Created by user278021 on 11/11/25.
//

import SwiftUI
internal import CoreData

struct BookListView: View {
    @Environment(\.managedObjectContext) private var context
    
    @FetchRequest(
        entity: Book.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Book.title, ascending: true)
        ],
        animation: .default
    )
    
    private var fetchedBooks: FetchedResults<Book>
    
    @State private var searchText = ""
    
    private var filteredBooks: [Book]{
        if searchText.trimmingCharacters(in: .whitespaces).isEmpty{
            return Array(fetchedBooks)
        }else{
            return fetchedBooks.filter { book in
                let title = book.title ?? ""
                let author = book.author ?? ""
                return title.localizedCaseInsensitiveContains(searchText) || author.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    @State private var path: [Book?] = []
    
    var body: some View {
        NavigationStack(path: $path){
            List{
                ForEach(filteredBooks){ book in
                    Button{
                        path.append(book)
                    } label: {
                        HStack(){
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknown")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(book.author ?? "Unknown")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: book.isFavourite ? "star.fill" : "star")
                                .foregroundStyle(book.isFavourite ? .yellow : .black)
                        }
                        .padding(8)
                        .background(statusColor(for: book.status).opacity(0.5))
                        .cornerRadius(8)
                    }
                }
                .onDelete{ indices in
                    for index in indices{
                        context.delete(fetchedBooks[index])
                    }
                    try? context.save()
                }
            }
            .searchable(text: $searchText, prompt:  "Search Book")
            .navigationTitle("Books")
            .toolbar{
                ToolbarItem{
                    Button{
                        path.append(nil)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: Book?.self) { selectedBook in
                BookEditView(book: selectedBook)
            }
        }
    }
    
    func statusColor(for status: String?) -> Color {
        switch status {
        case "To Read":
            return .gray
        case "In Progress":
            return .blue
        case "Completed":
            return .green
        default:
            return .white
        }
    }
}
