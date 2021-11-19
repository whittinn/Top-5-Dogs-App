//
//  NetworkManager.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/5/21.
//

import UIKit


public class NetworkMananger{
    
    static let shared = NetworkMananger()
    
    private init () {}
    
    func getInfo(completion: @escaping (Result<[Hit],Error>)-> Void){
        
        guard let url = URL(string: "https://pixabay.com/api/?key=23315704-d9d910a121ec124c7f8db5a43&q=golden_retriever&image_type=photo") else {
            fatalError("error with url")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else  {
                print("Error completing URL")
                completion(.failure(error!))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                completion (.success(response.hits))
                
            }catch{
                print("error with retrieving data")
                completion(.failure(error))
                
            }
            
        }.resume()
        
    }
    
    func frenchBulldogInfo(completion: @escaping (Result<[Hit],Error>)->Void){
        
        guard let url = URL(string: "https://pixabay.com/api/?key=23315704-d9d910a121ec124c7f8db5a43&q=french_bulldog&image_type=photo") else {
            fatalError("Error with url")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error with data")
                completion(.failure(error!))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let response =  try decoder.decode(Response.self, from: data)
                completion(.success(response.hits))
            }catch{
                print("error retrieving data")
                completion(.failure(error))
            }
            
            
        }.resume()
        
        
        
    }
    
    
    func beagleInfo(completion: @escaping (Result<[Hit],Error>)->Void){
        
        
        
        guard let url = URL(string: "https://pixabay.com/api/?key=23315704-d9d910a121ec124c7f8db5a43&q=beagle&image_type=photo") else {
            fatalError("print error")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error loading data")
                completion(.failure(error!))
                return
            }
            
            
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                completion(.success(response.hits))
                
            }catch{
                print("error with retrieving data")
                completion(.failure(error))
                
            }
            
            
        }.resume()
        
        
        
        
        
    }
    
    
    func downloadLabradorInfo(completion: @escaping (Result<[Hit],Error>)-> Void){
        
        guard  let url = URL(string: "https://pixabay.com/api/?key=23315704-d9d910a121ec124c7f8db5a43&q=labrador_retriever&image_type=photo") else {
            fatalError("Error with url")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{
                
                print("Error with downloading")
                completion(.failure(error!))
                return
            }
            
            do{
              
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                completion(.success(response.hits))
                
                
            }catch{
                
                print("Error with data")
                completion(.failure(error))
                
            }
        }.resume()
        
        
        
    }
    
    
    func downloadGermanInfo(completion: @escaping (Result<[Hit],Error>)-> Void){
        
        
        guard let url = URL(string: "https://pixabay.com/api/?key=23315704-d9d910a121ec124c7f8db5a43&q=german_shepherd&image_type=photo") else {
            fatalError("Error with URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                
                print("Error loading data")
                completion(.failure(error!))
                return
            }
            
            do{
                
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                completion(.success(response.hits))
                
            }catch{
                print("error retrieving data")
                completion(.failure(error))
            }
        }.resume()
        
        
    }
    
    func downloadImage(from url:String, completion: @escaping (UIImage?)-> Void){
        
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let image = UIImage(data: data) else {
                print("error downloading images")
                completion(nil)
                return
                
            }
            completion(image)
            
        }.resume()
        
        
    }
    
}
