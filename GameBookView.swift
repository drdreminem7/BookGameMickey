import SwiftUI

func findChapter(by id: String, in gameBook: GameBook) -> Chapter? {
    return gameBook.chapters.first { $0.id == id }
}

struct GameBookView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text(gameBook.title)
                .font(.title)
                .bold()
            
            Divider()
            Text(gameBook.description)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                
            NavigationStack {
                NavigationLink {
                    if let chapter = findChapter(by: "начало", in: gameBook) {
                        ChapterView(chapter: chapter)
                    } else {
                        EmptyView()
                    }
                } label: {
                    Text("Начало на играта")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)
                .foregroundColor(.red)
            }
            .padding()
            
        }
        .padding()
        .cornerRadius(12)
    }
}

#Preview {
    GameBookView()
}
