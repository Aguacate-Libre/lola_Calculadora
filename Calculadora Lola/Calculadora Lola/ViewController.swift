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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicializar_calculadora()
    }
    
    
    @IBAction func esto_hace_el_boton(_ sender: UIButton) {
        if(estado_actual == estados_de_la_calculadora.seleccionar_numeros)
        {
                let text_a_añadir = botones_interfaz[(sender.restorationIdentifier ??
                    boton_operacion.restorationIdentifier) ?? "boton"]?.num
                    texto_a_cambiar.text = "\(texto_a_cambiar.text ?? "")\(text_a_añadir!)"
        }
        
        else if(estado_actual == estados_de_la_calculadora.escoger_operacion)
        {
            if let _mensajero: UIButton? = sender.restorationIdentifier
            {
                operacion_actual = botones_interfaz[_mensajero_id]?.operacion
                estado_actual = estados_de_la_calculadora.seleccionar_numeros
            }
            
            else
            {
                operacion_actual = nil
            }
            
            dibujar_numeros_u_operaciones_en_interfaz()
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
            dibujar_numeros_u_operaciones_en_interfaz()
        }
    }
    
    func dibujar_numeros_u_operaciones_en_interfaz()
    {
        if(estado_actual == estados_de_la_calculadora.escoger_operacion)
        {
            for elemento in botones_interfaz.values
            {
                //print(elemento.Referencia_a_boton_interfaz?.restorationIdentifier)
                elemento.Referencia_a_boton_interfaz?.setTitle(elemento.operacion, for: .normal)
            }
        }
        
        else if(estado_actual == estados_de_la_calculadora.seleccionar_numeros)
        {
            for elemento in botones_interfaz.values
            {
                //print(elemento.Referencia_a_boton_interfaz?.restorationIdentifier)
                elemento.Referencia_a_boton_interfaz?.setTitle(String(elemento.num), for: .normal)
            }
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
}

