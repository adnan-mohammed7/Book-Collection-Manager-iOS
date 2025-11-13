//
//  BookEditView.swift
//  Assignment-3
//
//  Created by user278021 on 11/11/25.
//

import SwiftUI
internal import CoreData

enum BookStatus: String, CaseIterable {
    case toRead = "To Read"
    case inProgress = "In Progress"
    case completed = "Completed"
}

struct BookEditView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String
    @State private var author: String
    @State private var publisher: String
    @State private var status: BookStatus
    @State private var isFav: Bool
    
    let book: Book?
    
    init(book: Book?){
        self.book = book
        self.title = book?.title ?? ""
        self.author = book?.author ?? ""
        self.publisher = book?.publisher ?? ""
        if let statusString = book?.status, let statusEnum = BookStatus(rawValue: statusString) {
            self.status = statusEnum
        } else {
            self.status = .toRead
        }
        self.isFav = book?.isFavourite ?? false
    }
    
    private var canSave: Bool{
        !title.isEmpty && !author.isEmpty && !publisher.isEmpty
    }
    var body: some View {
        VStack{
            Form{
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                TextField("Publisher", text: $publisher)
                Picker("Status", selection: $status){
                    ForEach(BookStatus.allCases, id:\.self){
                        statusCase in
                        Text(statusCase.rawValue).tag(statusCase)
                    }
                }
                Toggle("Favourite", isOn: $isFav)
            }
            .navigationTitle(book == nil ? "Add New Book" : "Update Book")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(book == nil ? "Save" : "Update"){
                        saveBook()
                    }
                    .disabled(!canSave)
                    .background(.blue)
                    .foregroundStyle(.white)
                }
            }
        }
    }
    
    func saveBook(){
        let statusString = status.rawValue
        
        if let selectedBook = book{
            selectedBook.title = title
            selectedBook.author = author
            selectedBook.publisher = publisher
            selectedBook.status = statusString
            selectedBook.isFavourite = isFav
        }else{
            let newBook = Book(context: context)
            newBook.title = title
            newBook.author = author
            newBook.publisher = publisher
            newBook.status = statusString
            newBook.isFavourite = isFav
        }
        
        try? context.save()
        dismiss()
    }
}
