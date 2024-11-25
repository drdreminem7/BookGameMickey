import Foundation

var gameBook: GameBook = load("gameData.json")

func load(_ filename: String) -> GameBook {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(GameBook.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(GameBook.self):\n\(error)")
    }
}
