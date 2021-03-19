//
//  ResultadoViewController.swift
//  Calculadora_Propinas
//
//  Created by Diego Zamora on 19/03/21.
//

import UIKit

class ResultadoViewController: UIViewController {
    
    // *** VARIABLES GLOBALES ***
    var miCuenta: Float?
    var miPropinaPercent: Int?
    var miNumPersonas: Int?
    
    
    // *** MIS ENLACES ***
    @IBOutlet weak var txtCuenta: UILabel!
    @IBOutlet weak var txtPropina: UILabel!
    @IBOutlet weak var txtTotalPagar: UILabel!
    @IBOutlet weak var txtNumPersonas: UILabel!
    @IBOutlet weak var txtResultado: UILabel!
    @IBOutlet weak var txtPersonas: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Calcular mi Resultado
        loadData()
    }
    
    func loadData() {
        txtCuenta.text = "$\(String(format: "%0.2f", miCuenta ?? 0.0))"
        txtPropina.text = "\(miPropinaPercent!) %"
        
        let total = miCuenta! + ((miCuenta!) * (Float(miPropinaPercent!)/100))
        
        txtTotalPagar.text = "$\(String(format: "%0.2f", total))"
        
        txtNumPersonas.text = "\(miNumPersonas!)"
        
        txtResultado.text = "$\(String(format: "%0.2f", total/Float(miNumPersonas!)))"
        
        
        if miNumPersonas! == 1 {
            txtPersonas.text = "Total a Pagar"
        }
        else
        {
            txtPersonas.text = "Por Persona"
        }
        
    }

    @IBAction func volverCalcular(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
