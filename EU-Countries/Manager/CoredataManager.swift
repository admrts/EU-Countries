//
//  CoredataManager.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 9.10.2022.
//

import CoreData
import UIKit

class CoredataManager {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveData() -> Bool{
        do  {
            try context.save()
            print("success")
            return true
        }catch {
            print("Save Failed")
            return false
        }
    }
    
    func deleteData(deleteObject: UUID) -> Bool {
        let idString = deleteObject.uuidString
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteCountry")
        request.predicate = NSPredicate(format: "id = %@", idString)
        do {
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject] {
                context.delete(result)
                try context.save()
            }
            return true
        }catch {
            print("Delete error \(error)")
            return false
        }
    }
    func loadData(completed: ((_ dataModel: CoredataModel) -> Void)  ) {
        var coredataModel = CoredataModel()
//        coredataModel.nameArray.removeAll()
//        coredataModel.flagArray.removeAll()
//        coredataModel.idArray.removeAll()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteCountry")
        request.returnsObjectsAsFaults = false
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do {
            let countries = try context.fetch(request) as! [NSManagedObject]
            for country in countries {
                let name = country.value(forKey: "name") as! String
                let flag = country.value(forKey: "flag") as! Data
                let capital = country.value(forKey: "capital") as! String
                let population = country.value(forKey: "population") as! String
                let language = country.value(forKey: "language") as! String
                let currency = country.value(forKey: "currency") as! String
                let id = country.value(forKey: "id") as! UUID
                coredataModel.nameArray.append(name)
                coredataModel.flagArray.append(flag)
                coredataModel.capitalArray.append(capital)
                coredataModel.populationArray.append(population)
                coredataModel.languageArray.append(language)
                coredataModel.currencyArray.append(currency)
                coredataModel.idArray.append(id)
                completed(coredataModel)
            }
            print("asd")
        }catch {
            completed(coredataModel)
            print(error.localizedDescription)
        }
    }
}
