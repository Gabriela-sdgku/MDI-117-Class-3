//
//  TaskModels.swift
//  TodoAppTask
//
//  Created by SDGKU on 01/11/25.
//

import Foundation
import SwiftUI

enum Priority: Int, Codable, Comparable, CaseIterable {
    case low = 0
    case medium = 1
    case high = 2
    
    var title: String {
        switch self {
        case .low: return "Low"
        case .medium: return "Medium"
        case .high: return "High"
        }
    }
    
    var color: Color {
        switch self {
        case .low: return .gray
        case .medium: return .orange
        case .high: return .red
        }
    }
    
    static func < (lhs: Priority, rhs: Priority) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct TaskItem: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool = false
    var creationDate: Date
    
    var priority: Priority = .low

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, creationDate: Date = Date(), priority: Priority = .medium) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.creationDate = creationDate
        self.priority = priority
    }
}

struct TaskGroup: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var symbolName: String
    var tasks: [TaskItem]
    
    init(id: UUID = UUID(), title: String, symbolName: String, tasks: [TaskItem]) {
        self.id = id
        self.title = title
        self.symbolName = symbolName
        self.tasks = tasks
    }
    
    mutating func sortTasks() {
        tasks.sort { $0.priority > $1.priority }
    }
}

struct ProfileCategory: Identifiable {
    let id = UUID()
    let name: LocalizedStringKey
    let imageName: String
    let storageKey: String
}

enum SidebarSelection: Hashable {
    case group(TaskGroup.ID)
    case profile
}
