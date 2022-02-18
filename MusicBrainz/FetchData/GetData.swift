//
//  GetData.swift
//  MusicBrainz
//
//  Created by Marcin on 15/02/2022.
//

import Foundation
class Getdata : ObservableObject{
    
    func getdata(completion: @escaping ([PlacesModel]) -> ()) {
        
        let url = "https://musicbrainz.org/ws/2/place/?fmt=json&offset=0&limit=99&query=begin:[1990%20TO%202050]"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!){ (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
                let json = try! decoder.decode(DataModel.self,from: data!)
                let places : [PlacesModel] = json.places
                    //print(places)
                DispatchQueue.main.async {
                    completion(places)
                }
            }
        }
        .resume()
    }
}
