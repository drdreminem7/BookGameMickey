import Foundation

struct GameBook: Decodable {
    var title: String
    var description: String
    var chapters: [Chapter]
}

struct Chapter: Decodable, Identifiable {
    var id: String
    var type: String?
    var title: String
    var text: String
    var actions: [Action]
}

struct Action: Decodable, Hashable {
    var description: String
    var next: String
}
