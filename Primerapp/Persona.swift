//
//  Persona.swift
//  Primerapp
//
//  Created by AdminUTM on 09/12/16.
//  Copyright © 2016 AdminUTM. All rights reserved.
//

//import Foundation
import UIKit
import CoreData

extension Persona {
    
    class func fetch()-> NSFetchRequest<Persona>
    {
        return fetchRequest()
    }
    
    class func agregarTodos(datos: [Dictionary<String, Any?>]) -> (agregados: Int, modificados: Int, errores: Int) {
        var agregados = 0
        var arrores = 0
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        for dato in datos
        {
        let nombre = dato["nombre"] as? String ?? ""
        let edad = dato["edad"] as? Int ?? -1
        let genero = dato["genero"] as? String ?? ""
        let foto = dato["foto"] as? String ?? ""
        let id = dato["id"] as? Int ?? -1
        
            if id == -1 {
                errores = errores + 1
            }else{
                let persona = selectId(id: id) ?? Persona(context: context)
            
            
                //let persona = Persona(context: context)
        
                persona.id = Int64(id)
                persona.nombre = nombre
                persona.edad = Int16(edad)
                persona.foto = foto
                persona.genero = genero
        
                print("Agregado Dato: \(nombre)")
        
        do{
            try context.save()
        agregados = agregados + 1
        }catch{
                    print("error guardando \(nombre)")
                }
        
            }
        return agregados
        }
    }
    
    class func selectTodos () -> [Persona]{
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = Persona.fetch()
        
        //let sort = NSSortDescriptor(key: "edad", ascending: true)
        
        //request.sortDescriptors = [sort]
        
        var personas = [Persona]()
        
        do{
            personas = try context.fetch(request) as [Persona]
        }catch{
            print("Error con la consulta \(error)")
        }
        return personas
    }
    
    class func selectNombre(nombre: String) -> [Persona]{
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = Persona.fetch()

        let predicado = NSPredicate(format: " nombre == %@ ", nombre)
        request.predicate = predicado
        
        var personas = [Persona]()
        
        do{
            personas = try context.fetch(request) as [Persona]
        }catch{
            print("Error con la consulta \(error)")
        }
        return personas

    }
    
    class func selectId(id: Int) -> Persona?{
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = Persona.fetch()
        
        let predicado = NSPredicate(format: " id == %ld ", id)
        request.predicate = predicado
        
        var personas = [Persona]()
        
        do{
            personas = try context.fetch(request) as [Persona]
        }catch{
            print("Error con la consulta \(error)")
        }
        return personas.first
        
    }

}
