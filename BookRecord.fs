// F# record type to represent book information
type Book = {
    Id: int
    Title: string
    Author: string
    ISBN: string
    PublicationYear: int
    Genre: string
    Price: decimal
    InStock: bool
}

// Example of creating a book instance
let sampleBook = {
    Id = 1
    Title = "The F# Programming Language"
    Author = "Microsoft"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "Programming"
    Price = 29.99m
    InStock = true
}

// Example of accessing book properties
printfn "Book Title: %s" sampleBook.Title
printfn "Author: %s" sampleBook.Author
printfn "Price: $%.2f" sampleBook.Price