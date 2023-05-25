import os
import subprocess
from tabulate import tabulate
import mysql.connector
# -*- coding: utf-8 -*-


def nuevoProducto(id, nombre, clase, inventario, precio):
    mycursor.execute("INSERT INTO producto VALUES (%s,%s,%s,%s,%s)",
                     (id, nombre, clase, inventario, precio))
    db.commit()


def addInventario(Prod, suma, idProd):
    # Obtener los nombres de los productos disponibles
    mycursor.execute("SELECT nombre FROM " + Prod)
    results = mycursor.fetchall()
    product_names = [row[0] for row in results]

    # Mostrar los nombres de los productos disponibles al usuario
    clear_screen()
    print("Productos disponibles:")
    for i, name in enumerate(product_names, start=1):
        print(f"{i}. {name}")

    # Solicitar al usuario que seleccione el producto
    while True:
        try:
            choice = int(input("Seleccione el número del producto: "))
            if 1 <= choice <= len(product_names):
                break
            else:
                print("Opción inválida. Por favor, ingrese un número válido.")
        except ValueError:
            print("Opción inválida. Por favor, ingrese un número válido.")

    selected_product = product_names[choice - 1]

    # Resto de la lógica para añadir inventario
    query = "SELECT inventario FROM " + Prod
    mycursor.execute(query)
    result = mycursor.fetchone()
    db.commit()
    print("Inventario Viejo: " + str(result[0]))
    new_inventory = int(result[0]) + suma
    mycursor.execute(
        "UPDATE producto SET inventario = %s WHERE nombre = %s", (new_inventory, selected_product))
    db.commit()

    query = "SELECT inventario FROM " + Prod
    mycursor.execute(query)
    result = mycursor.fetchone()

    print("Inventario actualizado: " + str(result[0]))


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
    display_table(selected_table)

def display_table(table_name):
    clear_screen()
    query = "SELECT * FROM " + table_name
    mycursor.execute(query)

    results = mycursor.fetchall()
    headers = [desc[0] for desc in mycursor.description]
    print(tabulate(results, headers=headers, tablefmt="fancy_grid"))

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
        # Lógica para añadir inventario
        prod = input("Ingrese el nombre del producto: ")
        suma = int(input("Ingrese la cantidad a añadir al inventario: "))
        prodID = input("Ingrese el ID del producto: ")
        addInventario(prod, suma, prodID)

    elif choice == "3":
        # Lógica para nuevo producto
        id = input("Ingrese el ID del nuevo producto: ")
        nombre = input("Ingrese el nombre del nuevo producto: ")
        clase = input("Ingrese la clase del nuevo producto: ")
        inventario = input("Ingrese el inventario del nuevo producto: ")
        precio = input("Ingrese el precio del nuevo producto: ")
        nuevoProducto(id, nombre, clase, inventario, precio)
        print("Producto agregado exitosamente.")

    elif choice == "4":
        # Salir del programa y regresar al inicio de sesión
        os.system("cls")
        regresarLogin()
    else:
        verMenu()
        print("Opción inválida. Por favor, ingrese una opción válida.")



def login():
    clear_screen()
    # -*- coding: utf-8 -*-
    print("""
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
    """)

    sqlPassword = input("Enter username:")

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
