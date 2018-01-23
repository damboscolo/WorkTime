//
//  DropboxProvider.swift
//  Worktime
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import Moya

enum DropboxProvider {
    case allGames
}

extension DropboxProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://dl.dropboxusercontent.com/")!
    }
    var path: String {
        switch self {
        case .allGames: return "s/1b7jlwii7jfvuh0/games"
        }
    }
    var method: Moya.Method {
        switch self {
        case .allGames: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .allGames: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
