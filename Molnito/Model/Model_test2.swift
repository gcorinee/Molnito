//
//  Model_test2.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/14.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var items = [PostModel]()
    let prefixUrl = "http://localhost:3000"
    
    init(){
        createPosts()
    }
    
    func createPosts(){
        guard let url = URL(string: "\(prefixUrl)/createPosts") else{
            print("Not found url")
            return
        }
        
    URLSession.shared.dataTask(with: url){(data, res, error) in
        if error != nil{
            print("error", error?.localizedDescription ?? "")
            return
        }
        do{
            if let data = data{
                let result = try JSONDecoder().decode(DataModel.self, from:data)
                DispatchQueue.main.async {
                    self.items = result.data
                }
            }
        }catch let JsonError{
            print("fetch json error:", JsonError.localizedDescription)
        }
    }.resume()
    }
}

func requestGet(url: String, completionHandler: @escaping(Bool, Any) -> Void){
    print("HELLO")
}

