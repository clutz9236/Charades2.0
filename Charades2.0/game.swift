//
//  game.swift
//  Charades2.0
//
//  Created by Rachel Ebert on 5/15/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation

struct WhichArray {
    let AnimalWords =  ["Llama", "Dog", "Fly", "Parrot", "Sheep", "Coyote", "Lion", "Zebra", "Cheetah", "Polar Bear", "Bear", "Owl", "Tiger", "Husky", "Panda", "Monkey", "Penguin", "Peacock", "Fox", "Dolphin", "Deer", "Chicken", "Turkey", "Pig", "Fish", "Rhino", "Cow", "Frog", "Bunny", "Wolf", "Porcupine", "Whale", "Kangaroo", "Cat", "Horse", "Snake", "Dragon", "Clownfish", "African Buffalo", "Alpaca", "Baboon", "Aardvark", "African Bush Elephant", "Elephant", "Alligator", "Tortoise", "Water Spaniel", "Antelope", "Hare", "Rabbit", "Hornet", "Badger", "Camel", "Barracuda", "Basset Hound", "Beaver", "Bison", "Black Widow", "Buffalo", "Bulldog", "Butterfly", "Capybara", "Caterpillar", "Centipede", "Chameleon", "Chihuahua", "Chipmunk", "Cougar", "Crocodile", "Donkey", "Eel", "Emu", "Falcon", "Flat Coat Retriever", "Flying Squirrel", "Gecko", "Giant African Land Snail", "Honey Bee", "Seal", "Guppy", "Shark", "Mouse", "Iguana", "Jaguar", "Jellyfish", "Komodo Dragon", "Octopus", "Opossum", "Mongoose", "Platypus", "Raccoon", "Swan", "Walrus", "Wooly Mammoth"]
    
    let FamousPeople = ["Jay - Z", "Brad Pitt", "Katy Perry", "Benedict Cumberbatch", "Donald Trump", "Oprah", "Prince Harry", "Sandra Bullock", "Tom Hanks", "Chris Pratt", "Chris Evans", "Scarlett Johansson", "Tom Holland", "Josh Brolin",  "Robert Downey Jr", "Stan Lee", "Chris Hemsworth", "Vin Diesel", "Mark Ruffalo", "Ninja", "Angelina Jolie", "Kim Kardashian", "Natalie Portman", "Viola Davis", "Selena Gomez", "Amy Adams", "Alicia Keys", "Anne Hathaway", "Blake Lively", "Avril Lavigne", "Brooke Shield", "Celine Dion", "Christina Aguilera", "Corbin Bleu", "Courteney Cox", "Dakota Fanning", "Drew Barrymore", "Emma Roberts", "Ellen DeGeneres", "Emma Watson", "Fergie", "Gwen Stefani", "George Clooney", "Hugh Jackman", "Hilary Duff", "Heath Ledger", "Isla Fisher", "James Franco", "Janet Jackson", "Jennifer Lopez", "Jamie Lynn Spears", "Jessica Alba", "Joe Jonas", "John Krasinski", "Amy Pohler", "John Mayer", "Jordin Sparks", "Johnny Depp", "Jude Law", "Julia Roberts", "Josh Hutcherson", "Katie Holmes", "Kate Hudson", "Justin Timberlake", "Justin Beiber", "Keira Knightley", "Keith Urban", "Kellan Lutz", "Kelly Clarkson", "Kelly Ripa", "Kerry Washington", "Kirsten Dunst", "Kristen Stewart", "Lady Gaga", "Madonna", "Lea Michele", "Mandy Moore", "Mariah Carey", "Matt Damon", "Ed Sheeran"]
    
    let avengersWords = ["Captain America", "Falcon", "Ant-man", "Wasp", "Vision", "Scarlet Witch", "Hulk", "Thor", "Phil Coulson", "Bucky Barnes", "Spiderman", "Hawkeye", "Black Panther", "Wakanda", "Thanos", "Proxima Midnight", "The Ebony Maw", "Corvus Glaive", "Black Dwarf", "Loki", "Rocket", "Groot", "Star Lord", "Gamora","Drax", "Mantis", "Black Widow", "Ronan The Accuser", "Ego", "Deadpool", "Nebula", "Quicksilver", "Captain Marvel", "Daredevil", "War Machine", "Apocalypse"]
    
    let stateWords = ["Washington", "Montana", "North Dakota", "Minnesota", "Wisconsin", "Michigan", "Ohio", "Pennsylvania", "New York", "New Hampshire", "Maine", "Massachusetts", "Delaware", "Rhode Island", "Maryland", "Vermont", "New Jersey", "Connecitcut", "Virginia", "West Virginia", "North Carolina", "South Carolina", "Georgia", "Florida", "Alabama", "Mississippi", "Louisiana", "Texas", "New Mexico", "Arizona", "California", "Nevads", "Utah", "Colorado", "Kansas", "Missouri", "Illinois", "Indiana", "Kentucky", "Tennessee", "Oregon", "Wyoming", "South Dakota", "Oklahoma", "Arkansas", "Alaska", "Hawaii"]
    
    let throwback = ["Party in the USA", "Hollaback Girl", "Turn Up the Music", "All Star", "Beautiful Soul", "Your Love Is My Drug", "So What", "Sk8ter Boi", "Gold Digger", "Crazy in Love", "Ridin' Solo", "Single Ladies", "Dirty Little Secret", "Hot N Cold", "Stacy's Mom", "Fergalicious", "Bye, Bye, Bye", "Sugar, We're Goin Down", "1985", "Mr. Brightside", "Call Me Maybe", "Over My Head", "Wannabe", "Hall of Fame", "You Belong With Me", "Baby", "Year 3000", "Pokerface", "I'm a Believer", "Set Fire to the Rain", "Hey Soul Sister", "Everybody Talks", "Airplanes", "Baby Got Back", "I Wanna Dance with Somebody", "Hips Don't Lie", "Oops... I Did It Again", "I Want It That Way", "Super Bass", "California Girls", "Since You Been Gone", "How to Save a Life", "Want U Back", "Sweet Carolina", "Love the Way You Lie", "The Middle", "Ride with Me", "Potential Break Up Song", "Viva La Vida", "A Thousand Miles"]
    
    let movies = ["Titanic", "The Godfather", "Star Wars", "The Wizard of Oz", "Jaws", "Rocky", "Gone with the Wind", "Psycho", "The Terminator", "King Kong", "Jurassic Park", "Casablanca", "Back to the Future" ,"Raiders of the Lost Ark", "E.T.", "The Matrix", "Ferris Bueller's Day Off", "The Silence of the Lambs", "Citizen Kane", "High School Musical", "Cadet Kelly", "The Princess Bride", "The Shining", "Pulp Ficiton", "Top Gun", "Ghostbusters", "Forrest Gump", "Mission: Impossible", "Lady and the Tramp", "The Lion King", "Beauty and the Beast", "Saturday Night Fever", "Remember the Titans", "Avengers", "Harry Potter", "Caddyshack", "Dirty Dancing", "The Lord of the Rings", "Die Hard", "Toy Story", "Superman", "Singin' in the Rain", "A Christmas Story", "Rain Man", "The Sound of Music", "Edward Scissorhands", "Schindler's List", "Groundhog Day", "Mean Girls", "Blade Runner", "Poltergeist", "Scream", "I Know What You Did Last Summer", "Grease", "West Side Story", "Footloose", "It's a Wonderful Life", "The Sandlot", "Saving Private Ryan", "The Shawshank Redemption", "The Breakfast Club", "Sixteen Candles", "Planet of the Apes", "The Dark Knight", "10 Things I Hate About You", "The Exorcist", "Mary Poppins", "Rebel Without a Cause", "Apollo 13", "Willy Wonka and the Chocolate Factory", "Breakfast at Tiffany's", "Snow White and the Seven Dwarves", "Herbie Fully Loaded", "The Parent Trap", "Bambi", "Carrie", "Rudy", "Clueless", "Home Alone", "Pirates of the Caribbean", "V for Vendetta", "Finding Nemo", "Finding Dory", "Mrs. Doubtfire", "Peter Pan", "Jumanji", "Good Will Hunting", "Shrek", "Heathers", "Men in Black", "Deadpool", "The Truman Show"]
}
