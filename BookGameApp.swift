//
//  BookGameApp.swift
//  BookGame
//
//  Created by Harry on 8.11.24.
//

import SwiftUI

@main
struct BookGameApp: App {
    var body: some Scene {
        WindowGroup {
            ChapterView(chapter: gameBook.chapters[1])
        }
    }
}
