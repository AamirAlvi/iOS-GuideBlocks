//
//  MyChecklistViewModel.swift
//  iOS-GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/9.
//  Copyright © 2024 Contextual.
//

import Foundation

class MyChecklistViewModel : ObservableObject {

    @Published var toDoTasks = [ToDoTaskModel]()
    
    init() {
        updateTasks()
    }
    
    func updateTasks() {
        var toDoTaskModels = [ToDoTaskModel]()
        for i in 1...12 {
            let toDoTaskModel = ToDoTaskModel(
                id: "task\(i)",
                name: "Task \(i)",
                checked: i.isPrime(),
                enabled: true,
                action: { text in print("Action for task \(i)") }
            )
            toDoTaskModels.append(toDoTaskModel)
        }
        toDoTasks = toDoTaskModels
    }
    
}
