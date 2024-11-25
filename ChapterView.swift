import SwiftUI

struct ChapterView: View {
    let chapter: Chapter
    
    var body: some View {
        NavigationStack {
            Text(chapter.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text(chapter.text)
                .font(.body)
                .padding()
            
            ForEach(chapter.actions, id: \.description) { action in
                NavigationLink {
                    if let newChapter = findChapter(by: action.next, in: gameBook) {
                        ChapterView(chapter: newChapter)
                    } else {
                        ChapterView(chapter: gameBook.chapters[0])
                    }
                } label: {
                    Text(action.description)
                }
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)
                .foregroundColor(.red)
            }
            
            if chapter.actions.isEmpty {
                NavigationLink {
                    ChapterView(chapter: gameBook.chapters[0])
                } label: {
                    Text("Ново приключение")
                        .bold()
                }
                .padding()
                .background(Color.purple.opacity(0.1))
                .cornerRadius(20)
                .foregroundStyle(.purple)
                .padding(.top)
                .navigationBarBackButtonHidden()
            }
        }
        .padding()
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ChapterView(chapter: gameBook.chapters[0])
}
