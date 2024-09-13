//
//  ViewController.swift
//  Calculadora Lola
//
//  Created by alumno on 8/28/24.
//

import UIKit

enum estados_de_la_calculadora
{
    case seleccionar_numeros
    case escoger_operacion
    case mostrar_resultado
}

class ViewController: UIViewController {
    var estado_actual: estados_de_la_calculadora =
    estados_de_la_calculadora.seleccionar_numeros
    
    @IBOutlet weak var boton_para_interactuar: UIButton!
    @IBOutlet weak var texto_a_cambiar: UILabel!
    @IBOutlet weak var boton_operacion: UIButton!
    @IBOutlet weak var stack_view: UIStackView!
    
    var botones_interfaz: Dictionary <String, IUBotonCalculadora> = [:]
    var operacion_actual: String?
    var numero_actual: Double = 0.0
    var numero_anterior: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicializar_calculadora()
    }
    
    
    @IBAction func esto_hace_el_boton(_ sender: UIButton) {
        if(estado_actual == estados_de_la_calculadora.seleccionar_numeros)
        {
            if let _mensajero_id = sender.restorationIdentifier
            {
                let texto_cache = botones_interfaz[_mensajero_id]?.num
                texto_a_cambiar.text = "\(texto_a_cambiar.text ?? "")\(texto_cache!)"
            }
        }
        
        else if(estado_actual == estados_de_la_calculadora.mostrar_resultado)
        {
            if let _mensajero_id = sender.restorationIdentifier
            {
                let texto_cache = botones_interfaz[_mensajero_id]?.num
                texto_a_cambiar.text = "\(texto_cache)"
                estado_actual = estados_de_la_calculadora.seleccionar_numeros
            }
        }
    }
    
    func inicializar_calculadora() -> Void
    {
        crear_arreglo_botones()
        identificar_botones()
    }
    func crear_arreglo_botones() -> Void
    {
        botones_interfaz = IUBotonCalculadora.Crear_Arreglo()
    }
    
    @IBAction func boton_operacion_pulsado (sender: UIButton)
    {
        boton_operacion.setTitle("Ñ", for: .normal)
        if (estado_actual == estados_de_la_calculadora.seleccionar_numeros)
        {
            estado_actual = estados_de_la_calculadora.escoger_operacion
        }
    }
    
    func identificar_botones()
    {
        /*
        for componente in self.view.subviews
        {
            print(componente.restorationIdentifier)
        }
        */
        
        for pila_de_componentes in stack_view.subviews
        {
            for boton in pila_de_componentes.subviews
            {
                //print(type(of: boton))
                if let identificador = boton.restorationIdentifier
                {
                    //print(botones_interfaz[identificador])
                    botones_interfaz[identificador]?.Referencia_a_boton_interfaz = boton as! UIButton
                }
            }
        }
    }
    
    @IBAction func obtener_resultado(_ sender: Any)
    {
        if numero_anterior != 0.0 && texto_a_cambiar.text != ""
        {
            if let numero_actual_string = texto_a_cambiar.text{
                numero_actual = Double(numero_actual_string) ?? 0.0
            }
            
            switch(operacion_actual)
            {
            case "+":
                texto_a_cambiar.text = "\(numero_anterior + numero_actual)"
            case "-":
                texto_a_cambiar.text = "\(numero_anterior - numero_actual)"
            case "/":
                texto_a_cambiar.text = "\(numero_anterior / numero_actual)"
            case "x":
                texto_a_cambiar.text = "\(numero_anterior * numero_actual)"
            default:
                texto_a_cambiar.text = "Hay un error"
            }
            estado_actual = estados_de_la_calculadora.mostrar_resultado
        }
    }
    
    
    @IBAction func multiplicar_numeros(_ sender: Any)
    {
        operacion_actual = "x"
        if let numero_actual: String = texto_a_cambiar.text
        {
            numero_anterior = Double(numero_actual) ?? 0.0
        }
        
        texto_a_cambiar.text = ""
    }
    
    
    @IBAction func dividir_numeros(_ sender: Any)
    {
        operacion_actual = "/"
        if let numero_actual: String = texto_a_cambiar.text
        {
            numero_anterior = Double(numero_actual) ?? 0.0
        }
        
        texto_a_cambiar.text = ""
    }
    
    @IBAction func sumar_numeros(_ sender: Any)
    {
        operacion_actual = "+"
        if let numero_actual: String = texto_a_cambiar.text
        {
            numero_anterior = Double(numero_actual) ?? 0.0
        }
        
        texto_a_cambiar.text = ""
    }
    
    @IBAction func restar_numeros(_ sender: Any)
    {
        operacion_actual = "-"
        if let numero_actual: String = texto_a_cambiar.text
        {
            numero_anterior = Double(numero_actual) ?? 0.0
        }
        
        texto_a_cambiar.text = ""
    }
    
    
}

