//
//  ViewController.swift
//  Primerapp
//
//  Created by AdminUTM on 05/12/16.
//  Copyright © 2016 AdminUTM. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetalleViewControllerDelegate, AgregarViewControllerDelegate {
        var datos = [("Alan",30), ("Erick",37), ("Alvaro",20), ("Denisse", 23), ("Enrique", 26), ("Alan",30), ("Erick",37), ("Alvaro",20), ("Denisse", 23), ("Enrique", 26), ("Alan",30), ("Erick",37), ("Alvaro",20), ("Denisse", 23), ("Enrique", 26), ("Alan",30), ("Erick",37), ("Alvaro",20), ("Denisse", 23), ("Enrique", 26), ("Alan",30), ("Erick",37), ("Alvaro",20), ("Denisse", 23), ("Enrique", 26), ("Alan",30), ("Erick",37), ("Alvaro",20), ("Denisse", 23), ("Enrique", 26), ("Alan",30), ("Erick",37), ("Alvaro",20), ("Denisse", 23), ("Enrique", 26), ("Alan",30), ("Erick",37), ("Alvaro",20), ("Denisse", 23), ("Enrique", 26), ("Alan",30), ("Erick",37), ("Alvaro",20), ("Denisse", 23), ("Enrique", 26)]
    
    var esEdicion = false
    
    @IBAction func btnRefresh(_ sender: Any) {
        
        //let url = URL(string: "https://graph.facebook.com/1344787638894442/picture?type=large")
        let idFacebook = FBSDKAccessToken.current().userID
        let cadenaUrl = URL(string: "https://graph.facebook.com/\(idFacebook!)/picture?type=large")
        let dato : Data?
        
        /*do{
            dato = try Data(contentsOf: url!)
            imgFoto.image = UIImage(data: dato!)
        }catch{
            print("Error cargando la imagen.! \(error.localizedDescription)")
            dato = nil
            imgFoto.image = UIImage(named: "androide")
        }*/
        
        imgFoto.loadPicture(url: cadenaUrl)
       
    }
    @IBAction func btnAgregar_Click(_ sender: Any) {
        performSegue(withIdentifier: "Agregar Segue", sender: self)
    }
    
    func agregarRegistro(nombre: String, edad: Int){
        datos.append(nombre, edad)
        tblTabla.reloadData()
    }
    
    func modificarRegistro(nombre: String, edad: Int, fila: Int) {
        datos.remove(at: fila)
        datos.insert((nombre, edad), at: fila)
        tblTabla.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("vista cargada")
        imgFoto.image = UIImage(named: "androide")
        lblNombre.text = "Androide"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var tblTabla: UITableView!
    
    func numeroCambiado(numero: Int) {
        print("Numero cambiado: \(numero)")
        datos[numero].1 = datos[numero].1 + 1
        tblTabla.reloadData()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return datos.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let eliminar = UITableViewRowAction(style: .destructive, title: "Borrar", handler: borrarFila)
        
        let editar = UITableViewRowAction(style: .normal, title: "Editar", handler: editarFila)
        
        return [eliminar, editar]
    }
    
    func borrarFila(sender: UITableViewRowAction, indexPath : IndexPath){
        datos.remove(at: indexPath.row)
        tblTabla.reloadData()
    }
    
    func editarFila(sender: UITableViewRowAction, indexPath : IndexPath){
        esEdicion = true
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "Agregar Segue", sender: sender)
        
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //let proto = (indexPath.row % 2 == 0) ? "proto1" : "proto2"
        
        //let vista = tableView.dequeueReusableCell(withIdentifier: proto, for: indexPath) as! FilaTableViewCell

        let vista = tableView.dequeueReusableCell(withIdentifier: "proto1", for: indexPath) as! FilaTableViewCell
        //vista.lblIzq.text = "Index!"
        //vista.lblIzq.text = datos.description
        //vista.lblDer.text = "\(indexPath.row)"
        
        //if indexPath.row % 2 == 0 {
        vista.lblIzq.text = "\(datos[indexPath.row].0)"
        vista.lblDer.text = "\(datos[indexPath.row].1)"
        //}
        
        let idFacebook = FBSDKAccessToken.current().userID
        let cadenaUrl = "https://graph.facebook.com/\(idFacebook!)/picture?type=large"
        let dato : Data?
        
        /*do{
            dato = try Data(contentsOf: url!)
            vista.imgFotoFila.image = UIImage(data: dato!)
        }catch{
            print("Error cargando la imagen.! \(error.localizedDescription)")
            dato = nil
            vista.imgFotoFila.image = UIImage(named: "androide")
        }*/
        
        vista.imgFotoFila.loadPicture(url: cadenaUrl)
        
        return vista
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("fila\(indexPath.row)")
        
        filaSeleccionada = indexPath.row
        
        performSegue(withIdentifier: "Detalle Segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        switch segue.identifier! {
        case "Detalle Segue":
            let view = segue.destination as! detalle
            
            view.numeroFila = filaSeleccionada
            view.dato = datos[filaSeleccionada].0
            view.datoNumero = datos[filaSeleccionada].1
            view.delegado = self
            break
        case "Agregar Segue":
            let view = segue.destination as! Agregar
            
            if (esEdicion){
                view.fila = filaSeleccionada
                view.Nombre = datos[filaSeleccionada].0
                view.Edad = datos[filaSeleccionada].1
                esEdicion = false
            }
            
            view.delegado = self
            break
        default:
            break
        }
    }

    var filaSeleccionada = -1
}
