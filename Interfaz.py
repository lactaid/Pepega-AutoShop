import os
import subprocess
from tabulate import tabulate
import mysql.connector
import pwinput
import textwrap
from colorama import init, Fore
# auto-py-to-exe para convertirlo a exe
# -*- coding: utf-8 -*-


def nuevoProducto():
    nombre = input("Ingrese el nombre del nuevo producto: ")
    clase = input("Ingrese la clase del nuevo producto: ")
    inventario = input("Ingrese el inventario del nuevo producto: ")
    precio = input("Ingrese el precio del nuevo producto: ")

    mycursor.execute("INSERT INTO producto VALUES (%s,%s,%s,%s)",
                     (nombre, clase, inventario, precio))
    db.commit()
    print("Producto agregado exitosamente.")

    while True:
        user_input = input("Presione 'q' para regresar al menú principal: ")
        if user_input.lower() == "q":
            clear_screen()
            verMenu()
            break


def addInventario():
    # Obtener los productos disponibles (ID y Nombre)
    mycursor.execute(
        "SELECT idProducto, NombreProducto, inventario FROM Refacciones")
    results = mycursor.fetchall()
    products = [(row[0], row[1], row[2]) for row in results]

    # Mostrar los productos disponibles al usuario
    clear_screen()
    print("Productos disponibles:")
    for i, product in enumerate(products, start=1):
        print(f"{i}. {product[1]} | Stock: {product[2]} ")

    # Solicitar al usuario que seleccione el producto
    while True:
        try:
            choice = int(input("Seleccione el número del producto: "))
            if 1 <= choice <= len(products):
                break
            else:
                print("Opción inválida. Por favor, ingrese un número válido.")
        except ValueError:
            print("Opción inválida. Por favor, ingrese un número válido.")

    selected_product = products[choice - 1]

    clear_screen()
    # Resto de la lógica para añadir inventario
    query = "SELECT inventario FROM Refacciones WHERE idProducto = %s"
    mycursor.execute(query, (selected_product[0],))
    result = mycursor.fetchone()
    print("Inventario Viejo: " + str(result[0]))
    suma = int(input("Ingrese la cantidad a añadir al inventario: "))
    new_inventory = int(result[0]) + suma
    db.commit()
    mycursor.execute(
        "UPDATE Refacciones SET inventario = %s WHERE idProducto = %s", (new_inventory, selected_product[0]))
    db.commit()

    # Leer los resultados de la actualización del inventario
    mycursor.execute(
        "SELECT inventario FROM Refacciones WHERE idProducto = %s", (selected_product[0],))
    result = mycursor.fetchone()

    if result:
        print("Inventario actualizado: " + str(result[0]))
    else:
        print("No se pudo obtener el inventario actualizado.")

    while True:
        user_input = input("Presione 'q' para regresar al menú principal: ")
        if user_input.lower() == "q":
            clear_screen()
            verMenu()
            break


def verTabla():
    clear_screen()
    mycursor.execute("SHOW TABLES")
    results = mycursor.fetchall()
    table_names = [row[0] for row in results]

    # Mostrar las tablas disponibles al usuario
    print("Tablas disponibles:")
    for i, name in enumerate(table_names, start=1):
        print(f"{i}. {name}")

    # Solicitar al usuario que seleccione la tabla
    while True:
        try:
            choice = int(input("Seleccione el número de la tabla: "))
            if 1 <= choice <= len(table_names):
                break
            else:
                print("Opción inválida. Por favor, ingrese un número válido.")
        except ValueError:
            print("Opción inválida. Por favor, ingrese un número válido.")

    selected_table = table_names[choice - 1]
    tablaSeleccionada(selected_table)


def tablaSeleccionada(table_name):
    clear_screen()
    query = "SELECT * FROM " + table_name
    mycursor.execute(query)

    results = mycursor.fetchall()
    headers = [desc[0] for desc in mycursor.description]

    # Ajustar el tamaño de la descripción para que se ajuste al espacio en la tabla
    wrapped_results = []
    for row in results:
        wrapped_row = []
        for item in row:
            if isinstance(item, str) and len(item) > 20:
                wrapped_item = textwrap.fill(item, width=20)
                wrapped_row.append(wrapped_item)
            else:
                wrapped_row.append(item)
        wrapped_results.append(wrapped_row)

    print(tabulate(wrapped_results, headers=headers, tablefmt="fancy_grid"))

    while True:
        user_input = input("Presione 'q' para regresar al menú principal: ")
        if user_input.lower() == "q":
            clear_screen()
            verMenu()
            break


def regresarLogin():
    global db, mycursor
    db.close()  # Cerrar la conexión a la base de datos actual
    try:
        db = login()  # Volver a iniciar sesión
        mycursor = db.cursor()
        verMenu()  # Mostrar el menú principal
    except:
        print("Error de conexión. Por favor, reinicie e intente de nuevo.")
        exit()


def verMenu():
    os.system("cls")
    clear_screen()
    clear_screen()
    clear_screen()
    print("1. Ver Tabla")
    print("2. Añadir Inventario")
    print("3. Nuevo Producto")
    print("4. Salir")
    choice = input("Seleccione una opción: ")
    handle_menu_choice(choice)


def clear_screen():
    os.system("cls")


def handle_menu_choice(choice):
    if choice == "1":
        # Ver tabla
        os.system("cls")
        verTabla()

    elif choice == "2":
        # Añadir inventario
        addInventario()

    elif choice == "3":
        # Nuevo producto
        nuevoProducto()

    elif choice == "4":
        # Salir del programa y regresar al inicio de sesión
        os.system("cls")
        regresarLogin()
    else:
        verMenu()
        print("Opción inválida. Por favor, ingrese una opción válida.")


def login():
    clear_screen()
    print(Fore.GREEN + r"""
    ⠁⠁⠁⠁⠁⠁⠐⢶⣶⣶⣶⣤⣤⡀⠁⠁⣠⣀⣀⠁⠁⠁⠁⠁⠁⠁⠁⠁⠁⠁
    ⠁⠁⠁⠁⠁⠁⠁⠁⠙⢿⣯⣠⣶⣦⣤⣤⣌⣛⠻⢇⣠⣤⣤⠁⠁⠁⠁⠁⠁⠁
    ⠁⠁⠁⠁⠁⠁⠁⠁⠁⠁⠻⣿⣿⣿⡟⢉⡤⢤⣤⣤⡍⠛⢡⢖⣥⣶⣦⣀⠁⠁
    ⠁⠁⠁⠁⠁⠁⠁⠁⠁⠁⣠⣿⣿⣿⡏⣭⣶⣿⣿⠟⢿⣦⡡⣿⣿⡇⠁⡙⣷⡀
    ⠁⠁⠁⠁⠁⠁⠁⣀⣴⣿⣿⣿⣿⣿⣿⡞⣿⣿⡟⢀⡀⣿⣿⢻⣿⣿⣀⣁⣿⠏
    ⠁⠁⠁⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣟⢰⢻⣿⣇⣈⣴⣿⠟⢨⣛⠛⠛⠉⠁⠁
    ⠁⣠⣶⣿⣿⡟⢋⠤⣤⠘⢿⣿⣧⡙⠻⠌⠒⠙⠛⢛⣫⣥⣿⣦⡈⠉⣡⣴⣾⠇
    ⢰⣿⣿⣿⣿⠁⡇⠁⠙⠷⣤⡙⠻⢿⣿⣶⣶⣶⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⠁
    ⠘⣿⣿⣿⣿⣆⠻⣄⠁⣀⡀⠉⠙⠒⠂⠉⠍⠉⠉⠉⠉⣩⣍⣁⣂⡈⠠⠂⠁⠁
    ⠁⠘⢿⣿⣿⣿⣦⡉⠳⢬⣛⠷⢦⡄⠁⠁⠁⠁⠁⣀⣼⣿⣿⠿⠛⠋⠁⠁⠁⠁
    ⠁⠁⠁⠉⠻⢿⣿⣿⣷⣦⣬⣍⣓⡒⠒⣒⣂⣠⡬⠽⠓⠂⠁⠁⠁⠁⠁⠁
    """ + Fore.RESET)

    sqlPassword = pwinput.pwinput()

    db = mysql.connector.connect(
        host='localhost',
        user='root',
        passwd=sqlPassword,
        database='pepega_autoshop'
    )

    return db


try:
    db = login()
except:
    print("Error de conexión. Por favor, reinicie e intente de nuevo.")
    exit()
else:
    mycursor = db.cursor()
    verMenu()
