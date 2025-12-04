//
//  TaskModelTests.swift
//  StudentsToDo
//
//  Created by SDGKU
//

import XCTest
@testable import StudentsToDo

final class TaskModelTests: XCTestCase {
    func testTaskItemPriority() {
        // Arrange / given
        let task = TaskItem(title: "Test Priority Test")
        
        // Act & Assert / Then
        XCTAssertEqual(task.priority, .medium)
        
    }
    
    func testSortTasksByPriority() {
        // Arrange / GIVEN (we set up the data that we need to test
        let lowTask = TaskItem(title: "Low Priority Example", priority: .low)
        let highTask = TaskItem(title: "High Priority Example", priority: .high)
        let mediumTask = TaskItem(title: "Medium Priority Example", priority: . medium)
        
        // ACT or WHEN
        var group = TaskGroup(title: "Priority Example Group", symbolName: "folder", tasks: [lowTask, highTask, mediumTask])
        
        // Asser or THEN
        group.sortTasks()

        XCTAssertEqual(group.tasks[0].priority, .high)
        XCTAssertEqual(group.tasks[1].priority, .medium)
        XCTAssertEqual(group.tasks[2].priority, .low)
    }
}
