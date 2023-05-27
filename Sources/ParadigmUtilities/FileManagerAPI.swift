//
//  FileManagerAPI.swift
//  
//
//  Created by Evan Anderson on 6/15/22.
//

import Foundation

/// Read, write, and parse data from disk.
public enum FileManagerAPI {
    public static func get() -> FileManager {
        return FileManager.default
    }
    public static func get_file_container_url() -> URL {
        return ParadigmUtilities.file_container_url
    }
    
    public static func get_all_downloaded_files(folder_name: String) -> [DownloadedFile]? {
        let fullPath:String = get_file_container_url().appendingPathComponent(folder_name).path
        return get_all_downloaded_files(at_path: fullPath)
    }
    public static func get_all_downloaded_files(at_path: String) -> [DownloadedFile]? {
        let manager:FileManager = get()
        guard manager.fileExists(atPath: at_path), let items:[String] = try? manager.contentsOfDirectory(atPath: at_path), !items.isEmpty else { return nil }
        return items.map({ DownloadedFile(name: $0, parentPath: at_path) })
    }
    
    public static func file_exists(file: String) -> Bool {
        let dir:URL = get_file_container_url().appendingPathComponent(file)
        return file_exists(at_path: dir.path)
    }
    public static func file_exists(at_path: String) -> Bool {
        return get().fileExists(atPath: at_path)
    }
    public static func file_exists(at_path: String, is_directory: UnsafeMutablePointer<ObjCBool>?) -> Bool {
        return get().fileExists(atPath: at_path, isDirectory: is_directory)
    }
    
    public static func write_jsonable_throwable(file_name: String, json: any Jsonable, on_error: ((Error) -> Void)? = nil) {
        guard let data:Data = json.toData() else { return }
        write_data_throwable(file_name: file_name, file_extension: "json", data: data, on_error: on_error)
    }
    /// Tries to write `Encodable` into a json file with name `file_name` to disk.
    public static func write_encodable_throwable<T: Encodable>(file_name: String, encodable: T, on_error: ((Error) -> Void)? = nil) {
        do {
            let data:Data = try ParadigmUtilities.json_encoder.encode(encodable)
            write_data_throwable(file_name: file_name, file_extension: "json", data: data, on_error: on_error)
        } catch {
            on_error?(error)
        }
    }
    public static func write_string_throwable(file_name: String, file_extension: String, value: String, on_error: ((Error) -> Void)? = nil) {
        write_data_throwable(file_name: file_name, file_extension: file_extension, data: value.data(using: .utf8)!, on_error: on_error)
    }
    public static func write_data_throwable(file_name: String, file_extension: String, data: Data, on_error: ((Error) -> Void)? = nil) {
        let name:String = file_name + "." + file_extension
        let path:String = get_file_container_url().appendingPathComponent(name).path
        write_data_throwable(at_path: path, data: data, on_error: on_error)
    }
    private static func create_directories_for_file_if_needed_throwable(at_path: String) throws {
        let url:URL = URL(fileURLWithPath: at_path)
        try get().createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
    }
    public static func write_data_throwable(at_path: String, data: Data, on_error: ((Error) -> Void)? = nil) {
        Task {
            do {
                try create_directories_for_file_if_needed_throwable(at_path: at_path)
                let url:URL = URL(fileURLWithPath: at_path)
                try data.write(to: url)
            } catch {
                on_error?(error)
            }
        }
    }
    
    /// Tries to parse a `Decodable` from a json file on disk.
    public static func parse_decodable_throwable<T: Decodable>(file_name: String) throws -> T? {
        guard let data:Data = parse_json_data(file_name: file_name) else { return nil }
        return try ParadigmUtilities.json_decoder.decode(T.self, from: data)
    }
    /// Tries to parse a `Decodable` from a path, which is the location of a file, on disk.
    public static func parse_decodable_throwable<T: Decodable>(at path: String) throws -> T? {
        guard let data:Data = parse_data(at_path: path) else { return nil }
        return try ParadigmUtilities.json_decoder.decode(T.self, from: data)
    }
    
    private static func parse_json_data(file_name: String) -> Data? {
        return parse_data(file_name: file_name, file_extension: "json")
    }
    
    public static func parse_string(file_name: String, file_extension: String) -> String? {
        let targetExtension:String = "." + file_extension
        let name:String = file_name + (file_name.hasSuffix(targetExtension) ? "" : targetExtension)
        let url:URL = get_file_container_url().appendingPathComponent(name)
        return parse_string(at_url: url)
    }
    public static func parse_string(at_path: String) -> String? {
        let url:URL = URL(fileURLWithPath: at_path)
        return parse_string(at_url: url)
    }
    public static func parse_string(at_url: URL) -> String? {
        return try? String(contentsOf: at_url, encoding: .utf8)
    }
    
    public static func parse_data(file_name: String, file_extension: String) -> Data? {
        let targetExtension:String = "." + file_extension
        let name:String = file_name + (file_name.hasSuffix(targetExtension) ? "" : targetExtension)
        let url:URL = get_file_container_url().appendingPathComponent(name)
        return parse_data(at_url: url)
    }
    public static func parse_data(at_path: String) -> Data? {
        let url:URL = URL(fileURLWithPath: at_path)
        return parse_data(at_url: url)
    }
    public static func parse_data(at_url: URL) -> Data? {
        return try? Data(contentsOf: at_url)
    }
}
