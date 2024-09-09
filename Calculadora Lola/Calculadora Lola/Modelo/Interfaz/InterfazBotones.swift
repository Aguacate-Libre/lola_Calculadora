//
//  InterfazBotones.swift
//  Calculadora Lola
//
//  Created by alumno on 9/9/24.
//

import Foundation

struct IUBotonCalculadora
{
    var RestorationId: String
    var num: Character
    var operacion: String
    
    init (_ id: String, numero: Character, operaciones:
    String)
    {
        self.RestorationId = id
        self.num = numero
        self.operacion = operaciones
    }
    
    static func Crear_Arreglo() -> Dictionary<String, IUBotonCalculadora>
    {
        var botones_interfaz: Dictionary<String, IUBotonCalculadora> = [:]
        
        for numero in 0...9
        {
            botones_interfaz["boton_0"] = IUBotonCalculadora(
                "boton_0",
                numero: Character("0"),
                operaciones: "")
            
            botones_interfaz["boton_1"] = IUBotonCalculadora(
                "boton_1",
                numero: Character("1"),
                operaciones: "+")
            
            botones_interfaz["boton_2"] = IUBotonCalculadora(
                "boton_2",
                numero: Character("2"),
                operaciones: "")
            
            botones_interfaz["boton_3"] = IUBotonCalculadora(
                "boton_3",
                numero: Character("3"),
                operaciones: "-")
            
            botones_interfaz["boton_4"] = IUBotonCalculadora(
                "boton_4",
                numero: Character("4"),
                operaciones: "")
            
            botones_interfaz["boton_5"] = IUBotonCalculadora(
                "boton_5",
                numero: Character("5"),
                operaciones: "")
            
            botones_interfaz["boton_6"] = IUBotonCalculadora(
                "boton_6",
                numero: Character("6"),
                operaciones: "")
            
            botones_interfaz["boton_7"] = IUBotonCalculadora(
                "boton_7",
                numero: Character("7"),
                operaciones: "*")
            
            botones_interfaz["boton_8"] = IUBotonCalculadora(
                "boton_8",
                numero: Character("8"),
                operaciones: "")
            
            botones_interfaz["boton_9"] = IUBotonCalculadora(
                "boton_9",
                numero: Character("9"),
                operaciones: "/")
        }
        
        return botones_interfaz
    }
}
