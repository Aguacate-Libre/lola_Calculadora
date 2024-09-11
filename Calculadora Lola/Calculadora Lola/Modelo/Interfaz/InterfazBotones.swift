//
//  InterfazBotones.swift
//  Calculadora Lola
//
//  Created by alumno on 9/9/24.
//

import Foundation
import UIKit

struct IUBotonCalculadora
{
    var Referencia_a_boton_interfaz: UIButton?
    var num: Character
    var operacion: String
    
    init (numero: Character, operaciones: String)
    {
        self.Referencia_a_boton_interfaz = nil
        self.num = numero
        self.operacion = operaciones
    }
    
    static func Crear_Arreglo() -> Dictionary<String, IUBotonCalculadora>
    {
        var botones_interfaz: Dictionary<String, IUBotonCalculadora> = [:]
        
        for numero in 0...9
        {
            botones_interfaz["boton_0"] = IUBotonCalculadora(
                numero: Character("0"),
                operaciones: "")
            
            botones_interfaz["boton_1"] = IUBotonCalculadora(
                numero: Character("1"),
                operaciones: "+")
            
            botones_interfaz["boton_2"] = IUBotonCalculadora(
                numero: Character("2"),
                operaciones: "")
            
            botones_interfaz["boton_3"] = IUBotonCalculadora(
                numero: Character("3"),
                operaciones: "-")
            
            botones_interfaz["boton_4"] = IUBotonCalculadora(
                numero: Character("4"),
                operaciones: "")
            
            botones_interfaz["boton_5"] = IUBotonCalculadora(
                numero: Character("5"),
                operaciones: "")
            
            botones_interfaz["boton_6"] = IUBotonCalculadora(
                numero: Character("6"),
                operaciones: "")
            
            botones_interfaz["boton_7"] = IUBotonCalculadora(
                numero: Character("7"),
                operaciones: "*")
            
            botones_interfaz["boton_8"] = IUBotonCalculadora(
                numero: Character("8"),
                operaciones: "")
            
            botones_interfaz["boton_9"] = IUBotonCalculadora(
                numero: Character("9"),
                operaciones: "/")
        }
        
        return botones_interfaz
    }
}
