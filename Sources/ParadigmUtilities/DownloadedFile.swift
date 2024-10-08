//
//  DownloadedFile.swift
//  
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation

public struct DownloadedFile : Hashable, Sendable {
    public static func get(at path: String) -> DownloadedFile? {
        let fileName:String = path.split(separator: "/").last_nonoptional.as_string
        return FileManagerAPI.file_exists(at_path: path) ? DownloadedFile(name: fileName, parentPath: path.prefix(path.count-fileName.count-1).description) : nil
    }
    
    public let name:String
    public var parentPath:String
    
    public var full_path : String { parentPath + "/" + name }
    public var url : URL { URL(fileURLWithPath: full_path) }
    
    public init(name: String, parentPath: String) {
        self.name = name
        self.parentPath = parentPath
    }

    public func is_directory() -> Bool {
        var isDir:ObjCBool = false
        let exists:Bool = FileManagerAPI.file_exists(at_path: full_path, is_directory: &isDir)
        return exists && isDir.boolValue
    }
    public func get_files_at_full_path() -> [DownloadedFile]? {
        return FileManagerAPI.get_all_downloaded_files(folder_name: full_path)
    }
    public func get_files_at_name() -> [DownloadedFile]? {
        return FileManagerAPI.get_all_downloaded_files(at_path: full_path)
    }
    
    public func decoded<T: Decodable>() -> T? {
        return try? FileManagerAPI.parse_decodable_throwable(at: full_path)
    }
}
