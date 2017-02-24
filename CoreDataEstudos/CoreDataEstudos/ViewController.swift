//
//  ViewController.swift
//  CoreDataEstudos
//
//  Created by André Luís  Campopiano on 24/02/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        
        /*
         let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
         
         produto.setValue("PlayStation 4", forKey: "nome")
         produto.setValue("Video mai loco de todos", forKey: "descricao")
         produto.setValue("Preto", forKey: "cor")
         produto.setValue(1500.00, forKey: "preco")
         
         do{
         try context.save()
         print("salvou o role")
         }catch{
         print("nao salvou o role")
         }
         
         
         
         
         
         
         let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
         
         usuario.setValue("felipemauani", forKey: "loginUsuario")
         usuario.setValue("senha123", forKey: "senha")
         usuario.setValue("Felipe Manhani", forKey: "nome")
         usuario.setValue(40, forKey: "idade")
         
         do {
         try context.save()
         print("dados salvos")
         }catch{
         print("error ao salvar dados")
         }
         
         let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
         
         do{
         let usuarios = try  context.fetch(request)
         
         if usuarios.count > 0{
         
         for usuario in usuarios {
         
         if let nomeUsuario = (usuario as AnyObject).value(forKey: "nome") {
         print(nomeUsuario)
         }
         }
         }else {
         print("nenhum usuario")
         }
         
         }catch{
         print("error ao recuperar os dados")
         }
         */
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        
        //Ordenar de A-Z
        let orderAZ = NSSortDescriptor(key: "nome", ascending: true)
        
        //Ordenar de Z-A
        //let orderZA = NSSortDescriptor(key: "preco", ascending: false)
        
        
        //Aplicar filtros
        
        //let predicate = NSPredicate(format: "nome = %@", "Super Nintendo")
        
        //Sem case sensitve
        //let predicate = NSPredicate(format: "nome contains %@", "super")
        
        //Usando case sensitive
        //let predicate = NSPredicate(format: "nome contains [c] %@", "super")
        
        
        //Começa com
        //let predicate = NSPredicate(format: "nome beginswith [c] %@", "super")
        
        //Comparar
        //let predicate = NSPredicate(format: "preco > %@", "300")
        
        
        let filtroNome = NSPredicate(format: "nome contains [c] %@", "super")
        let filtroPreco = NSPredicate(format: "preco > %@", "300")
        
        //AND
        //let combinacaoFiltros = NSCompoundPredicate(andPredicateWithSubpredicates: [filtroNome, filtroPreco])
        
        
        //OR
        let combinacaoFiltros = NSCompoundPredicate(orPredicateWithSubpredicates: [filtroNome, filtroPreco])

        
        
        //Passa um array de filtros
        request.sortDescriptors = [orderAZ]
        request.predicate = combinacaoFiltros//NSCompoundPredicate(andPredicateWithSubpredicates: [filtroNome, filtroPreco])
        
        do{
            let produtos = try context.fetch(request)
            
            if produtos.count > 0 {
                
                for produto in produtos {
                    
                    let nomeProduto = (produto as AnyObject).value(forKey: "nome")
                    let precoProduto = (produto as AnyObject).value(forKey: "preco")
                    
                    print("Nome: " + String(describing: nomeProduto) + "Preco: " + String(describing: precoProduto))
                }
            }else {
                print("nenhum item encontrado")
            }
        }catch{
            print("deu ruim na hora de recuperar")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

