//
//  detalle.swift
//  Primerapp
//
//  Created by AdminUTM on 06/12/16.
//  Copyright © 2016 AdminUTM. All rights reserved.
//

import UIKit

protocol DetalleViewControllerDelegate {
    func numeroCambiado(numero: Int)
}

class detalle: UIViewController {

    // MARK: Declaraciones
    var numeroFila = -1
    var dato : String = ""
    var datoNumero : Int = 0
    var delegado : DetalleViewControllerDelegate? = nil
    
    @IBOutlet weak var lblNombre: UILabel!
    
    // MARK: Metodos
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblNombre.text = "Has elegido a \(dato) y tiene \(datoNumero) años."
        
        if delegado != nil
        {
            delegado?.numeroCambiado(numero: numeroFila)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
