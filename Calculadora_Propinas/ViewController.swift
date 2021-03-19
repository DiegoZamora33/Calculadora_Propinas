//
//  ViewController.swift
//  Calculadora_Propinas
//
//  Created by Diego Zamora on 18/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    // *** MIS ENLACES ***
    @IBOutlet weak var inputTotal: UITextField!
    @IBOutlet weak var miPropinaPercent: UILabel!
    @IBOutlet weak var numPersonas: UILabel!
    @IBOutlet weak var sliderPropina: UISlider!
    @IBOutlet weak var sliderPersonas: UISlider!
    
    
    
    
    // *** LOADER ***
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Para poder Ocultar el teclado
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
                view.addGestureRecognizer(tapGesture)
        
        /// Arreglos para mi textField de Total
        inputTotal.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        inputTotal.layer.borderWidth = 1
        inputTotal.layer.cornerRadius = 2
        
        
        /// Actualizar texto de Sliders
        
        // Propina
        sliderPropina.setValue(round(sliderPropina.value), animated: false)
        
        miPropinaPercent.text = "\(Int(sliderPropina.value))%"
        
        
        // Personas
        sliderPersonas.setValue(round(sliderPersonas.value), animated: false)
       
       
        numPersonas.text = "\(Int(sliderPersonas.value))"
    }

    
    
    // *** FUNCION PARA OCULTAR TECLADO ***
    @objc func tapGestureHandler() {
        inputTotal.endEditing(true)
      }
    
    // *** LISTENERS ***
    
    /// Action Propina
    @IBAction func onPropinaPercent(_ sender: UISlider) {
        
        // Ajustamos valores para evitar decimales
         sender.setValue(round(sender.value), animated: false)
        
        
        miPropinaPercent.text = "\(Int(sender.value))%"
    }
    
    /// Action Numero Personas
    @IBAction func onNumPersonas(_ sender: UISlider) {
        
        // Ajustamos valores para evitar decimales
         sender.setValue(round(sender.value), animated: false)
        
        
        numPersonas.text = "\(Int(sender.value))"
    }
    
    /// Btn Calcular
    @IBAction func btnCalcular(_ sender: UIButton) {
        performSegue(withIdentifier: "toResultado", sender: self)
    }
    
    /// @Overrides
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultado" {
            let toResultadoVC = segue.destination as! ResultadoViewController
            
            toResultadoVC.miCuenta = Float(inputTotal.text ?? "0.0")
            
            toResultadoVC.miPropinaPercent = Int(sliderPropina.value)
            
            toResultadoVC.miNumPersonas = Int(sliderPersonas.value)
        }
    }
}

