//
//  Interface.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/18.
//
import Foundation
import SwiftyJSON

func requestPOST(urls : String, body : Data) -> JSON{
    
    guard let url = URL(string : "http://192.249.18.198:80\(urls)") else { return JSON() }
    var request = URLRequest(url: url)
    request.httpMethod = "POST";
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = body
    var jsonData : JSON = JSON()
    let sem = DispatchSemaphore(value: 0)
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            sem.signal()
            return
        }
        guard let stringData : String = String(data: data, encoding: .utf8) else {
                print("Error: data to string failed.")
                sem.signal()
                return
            }
        jsonData = JSON.init(parseJSON: stringData)
            sem.signal()
            return
        
    }.resume()
    
    sem.wait()
    return jsonData
}

func requestPOSTwithList(urls : String, body : Data) -> JSON{
    
    guard let url = URL(string : "http://192.249.18.198:80\(urls)") else { return JSON() }
    var request = URLRequest(url: url)
    request.httpMethod = "POST";
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = body
    var jsonData : JSON = JSON()
    let sem = DispatchSemaphore(value: 0)
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            sem.signal()
            return
        }
        jsonData = try! JSON(data: data)
        print(jsonData)
        sem.signal()
        return
        
    }.resume()
    
    sem.wait()
    return jsonData
}

