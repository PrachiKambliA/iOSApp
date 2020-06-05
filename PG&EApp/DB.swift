//
//  DB.swift
//  PG&EApp
//
//  Created by Luis Valencia on 6/4/20.
//  Copyright © 2020 Infosys. All rights reserved.
//

import Foundation

final class DB {

    static let database = DB()
    private var requests = [Request]()
    private var manufacturers = [String]()
    private var materialTypes = [String]()
    private var ages = [String]()
    private var applications = [String]()
    private var division = [String]()
    private  init(){
        readJson();
    }
    
    func getRequests() -> [Request]{
    return requests
    }
    
    func getManufacturers() ->[String]{
        return manufacturers
    }
    func getMaterialTypes() ->[String]{
        return materialTypes
    }
    func getAges() ->[String]{
        return ages
    }
    func getApplications() ->[String]{
        return applications
    }
    func getDivision() -> [String]{
        return division
    }
    func addRequest(request: Request) {
        requests.append(request)
    }
    private  func readJson() {
        do {
            if let file = Bundle.main.url(forResource: "mockedRequests", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let dataArr = json as? [String: Any ]{
                    // json is an array
                    for req in (dataArr["requests"] as! [[String:Any]]) {
                        let id = req["id"] as? String ?? ""
                        let type = req["type"] as? String ?? ""
                        let subtype = req["subtype"] as? String ?? ""
                        let landId = req["lanId"] as? String ?? ""
                        let location = req["location"] as? String ?? ""
                        let status = req["status"] as? String ?? ""
                        let date = Date().addingTimeInterval(TimeInterval(Int.random(in: 1...100) * (-86000)))
                        
                        let request = Request(id: id, type: type, subtype: subtype, lanId: landId, location: location, status: status, date: date)
                        requests += [request]
                    }
                    manufacturers = dataArr["Manufacturer"] as! [String]
                    materialTypes = dataArr["MaterialType"] as! [String]
                    ages = dataArr["Age"] as! [String]
                    applications = dataArr["Application"] as! [String]
                    division = dataArr["Division"] as! [String]
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
