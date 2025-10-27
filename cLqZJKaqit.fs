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
    Title = "F# Programming"
    Author = "Expert Author"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "Programming"
    Price = 49.99m
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