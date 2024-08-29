//
//  AsyncTask.swift
//  
//
//  Created by Evan Anderson on 5/20/23.
//

public actor AsyncTask : ParadigmSharedInstance {
    public static var shared_identifier : ParadigmSharedInstanceIdentifier { ParadigmSharedInstanceIdentifier.async_task }
    
    private var ids:[AnyHashable:Task<Any?, Error>] = [AnyHashable:Task<Any?, Error>]()
    
    public init() {
    }
    
    public func get_count() -> Int {
        return ids.count
    }
    
    private func get_result<T>(identifier: AnyHashable, _ handler: @escaping () async throws -> T?) async throws -> T? {
        if let task:Task = ids[identifier] {
            return try await task.value as? T
        }
        let task:Task<Any?, Error> = Task {
            return try await handler()
        }
        ids[identifier] = task
        defer {
            ids[identifier] = nil
        }
        return try await task.value as? T
    }
    
    public static func get_result<T>(identifier: AnyHashable, _ handler: @escaping () async throws -> T?) async throws -> T? {
        return try await AsyncTask.shared.get_result(identifier: identifier, handler)
    }
}
