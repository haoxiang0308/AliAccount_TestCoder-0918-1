// F# Record Type for Book Information
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
    Genre = "Technical"
    Price = 29.99m
    InStock = true
}

// Function to display book information
let displayBook (book: Book) =
    printfn "Book ID: %d" book.Id
    printfn "Title: %s" book.Title
    printfn "Author: %s" book.Author
    printfn "ISBN: %s" book.ISBN
    printfn "Publication Year: %d" book.PublicationYear
    printfn "Genre: %s" book.Genre
    printfn "Price: $%.2f" book.Price
    printfn "In Stock: %b" book.InStock

// Example usage
displayBook sampleBook