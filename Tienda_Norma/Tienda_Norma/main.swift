//
//  main.swift
//  Tienda_Norma
//
//  Created by Josué David González Vera on 16/11/26.
//

import Foundation

// Estructura para modelar cada prenda de la Boutique Norma
struct Articulo {
    let id: Int
    let nombre: String
    let precio: Int
    var stock: Int
}

// Catálogo inicial con 4 artículos a la venta
var inventario: [Articulo] = [
    Articulo(id: 1, nombre: "Zapatos", precio: 250, stock: 150),
    Articulo(id: 2, nombre: "Playeras", precio: 100, stock: 700),
    Articulo(id: 3, nombre: "Pantalones", precio: 200, stock: 20),
    Articulo(id: 4, nombre: "Sombreros", precio: 300, stock: 100)
]

var opcionMenu: String = ""

// Ciclo principal que mantiene activa la tienda hasta que el cliente decida salir
while opcionMenu != "2" {
    print("********BIENVENIDO A BOUTIQUE NORMA********")
    print("--------Artículos--------\n")
    
    // Mostrar los 4 artículos con su nombre, precio y stock
    for item in inventario {
        print("_________________________")
        print("Opción: \(item.id)")
        print("Artículo: \(item.id). \(item.nombre)")
        print("Precio: \(item.precio)")
        print("Stock: \(item.stock)")
    }
    print("_________________________\n")
    
    // Menú principal de selección
    print("1. Comprar artículo")
    print("2. Salir")
    print("Seleccione: ", terminator: "")
    
    if let entrada = readLine() {
        opcionMenu = entrada
    }
    
    switch opcionMenu {
    case "1":
        print("Ingrese el número de artículo a comprar: ", terminator: "")
        if let inputId = readLine(), let idSeleccionado = Int(inputId), idSeleccionado >= 1 && idSeleccionado <= inventario.count {
            
            let indice = idSeleccionado - 1
            print("Ingrese la cantidad de artículos que desea comprar: ", terminator: "")
            
            if let inputCantidad = readLine(), let cantidad = Int(inputCantidad), cantidad > 0 {
                
                // Validación de inventario disponible
                if cantidad <= inventario[indice].stock {
                    let totalPagar = cantidad * inventario[indice].precio
                    inventario[indice].stock -= cantidad // Descuenta el stock comprado
                    
                    print("==========================================")
                    print("Usted ha comprado \(inventario[indice].id). \(inventario[indice].nombre) X \(cantidad)")
                    print("Total: \(totalPagar)")
                    print("GRACIAS POR SU COMPRA, VUELVA PRONTO A BOUTIQUE NORMA")
                    print("==========================================\n")
                } else {
                    print("No hay suficiente stock, lo sentimos\n")
                }
            } else {
                print("Cantidad no válida. Intente de nuevo.\n")
            }
        } else {
            print("Número de artículo no válido. Seleccione entre 1 y 4.\n")
        }
        
    case "2":
        print("\nSaliendo de Boutique Norma... ¡Hasta pronto!")
        
    default:
        print("\nOpción no válida, por favor elija 1 o 2.\n")
    }
}
