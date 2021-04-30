//
//  DBHelper.swift
//  Project1
//
//  Created by admin on 4/26/21.
//

//
//  DBHelper.swift
//  CoreDataDemo
//
//  Created by admin on 4/16/21.
//

import Foundation
import CoreData
import UIKit

class DBHelper{
    static var inst = DBHelper()
   

    func addData(object : [String:String]){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
          }
        let context = appDelegate.persistentContainer.viewContext
          
       
        let user = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context) as! UserData
        user.username = object["username"]
        //print(user.username)
        user.password = object["password"]
        user.completed = [""]

        do{
            try context.save()
            print("data saved")
        }
        catch{
            print("data not saved")
        }
    }
    func addSurvey(object : [String : String]){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
          }
        let context = appDelegate.persistentContainer.viewContext
          
       
        let survey = NSEntityDescription.insertNewObject(forEntityName: "Survey", into: context) as! Survey
        survey.name = object["name"]!
        
        survey.q1 = object["q1"]!
        survey.q2 = object["q2"]!
        survey.q3 = object["q3"]!
        survey.q4 = object["q4"]!
        survey.q5 = object["q5"]!
        

        do{
            try context.save()
            print("data saved")
        }
        catch{
            print("data not saved")
        }
    }
    func fetchSurvey(query: String) -> [String:String]{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return ["":""]
          }
        let context = appDelegate.persistentContainer.viewContext
        var fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Survey")
        
        fetchReq.predicate = NSPredicate(format: "name == %@", query)
        
       
        var survey = ["name" : query]
        do{
            let sur = try context.fetch(fetchReq)
          
            let users = sur as! [Survey]
            for data in users{
                let surve = data as! Survey
            
                if(surve.name! == query){
                    survey["q1"] = surve.q1
                    survey["q2"] = surve.q2
                    survey["q3"] = surve.q3
                    survey["q4"] = surve.q4
                    survey["q5"] = surve.q5
                    return survey
                }
                else {
                    continue
                }                
            }
        }
        catch{
            print("error")
        }
        return ["":""]
    }
    func dataExist( query : String) -> Bool{
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
          }
        let context = appDelegate.persistentContainer.viewContext
        var fetchReq = NSFetchRequest<NSManagedObject>(entityName: "UserData")
        fetchReq.predicate = NSPredicate(format: "username == %@", query)
        do{
            let usr = try context.fetch(fetchReq)
            let users = usr as! [UserData]
            for data in users{
                if(data.username as! String == query){
                    return true
                }
                else {
                    continue
                }
            }
            return false
        }
        catch{
            return false
        }
    }
    
    func surveyExist( query : String) -> Bool{
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
          }
        let context = appDelegate.persistentContainer.viewContext
        var fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Survey")
        
        fetchReq.predicate = NSPredicate(format: "name == %@", query)
        print(query)
        do{
            let sur = try context.fetch(fetchReq)
            print(sur.count)
            let users = sur as! [Survey]
            for data in users{
                print(data.name)
            
                if(data.name as! String == query){
                    return true
                }
                else {
                    continue
                }
                
            }
            return false
        }
        catch{
         
            return false
        }
    }
    func updateData(uName : String, uPass : String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
          }
        let context = appDelegate.persistentContainer.viewContext
         
        //var user = UserD()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserData")
        fetchReq.predicate = NSPredicate(format: "username == %@", uName)
        do{
            let usr = try context.fetch(fetchReq)
            for data in usr {
                let user = data as! UserData
                if(uName == user.username){
                    user.password = uPass
                    do{
                        try context.save()
                        print("data saved")
                    }
                    catch{
                        print("data not saved")
                    }
                    return                    
                }
                else{continue}
            }
        }
        catch{
            print("data could not be updated")
//
        }
    }
    func validatePass(uName : String, uPass : String) -> Bool{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
          }
        let context = appDelegate.persistentContainer.viewContext
         
        //var user = UserD()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserData")
       
        do{
            fetchReq.predicate = try NSPredicate(format: "username == %@", uName)
            
           
            let usr = try context.fetch(fetchReq)
            for data in usr {
                let user = data as! UserData
                if(uName == user.username && uPass == user.password){return true}
                else{continue}
                
                
            }
            return false

           
        }
        catch{
            return false
        }
    }
    
    func addCompletion(user : String, surN : String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
          }
        let context = appDelegate.persistentContainer.viewContext
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserData")
       
        do{
            fetchReq.predicate = try NSPredicate(format: "username == %@", user)
            
           
            let usr = try context.fetch(fetchReq)
            for data in usr {
                let curr = data as! UserData
                if(user == curr.username )
                {
                    curr.completed!.append(surN)
                    
                }
                else{continue}
                
                
            }
        }
            catch{
                print("could not fetch user")
                return
            }
                //print(user.username)
        

        do{
            try context.save()
            print("data saved")
        }
        catch{
            print("data not saved")
        }
    }
    
    func surComp( user : String, surv : String) -> Bool{
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
          }
        let context = appDelegate.persistentContainer.viewContext
        var fetchReq = NSFetchRequest<NSManagedObject>(entityName: "UserData")
        
        fetchReq.predicate = NSPredicate(format: "name == %@", user)
      
        do{
            let sur = try context.fetch(fetchReq)
            print(sur.count)
            let users = sur as! [UserData]
            for data in users{
            
                if(data.completed!.contains(surv)){
                    return true
                }
                else {
                    continue
                }
                
            }
            return false
        }
        catch{
         
            return false
        }
    }

}
