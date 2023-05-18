import os
import mysql.connector

myPassword = os.environ.get('MySqlPassword')

db = mysql.connector.connect(
    host='localhost',
    user='root',
    passwd=myPassword,
    database='pepega autoshop'
)

mycursor = db.cursor()

def nuevoProducto(id, nombre, clase, inventario, precio):
    mycursor.execute("INSERT INTO producto VALUES (%s,%s,%s,%s,%s)",(id,nombre, clase, inventario, precio))
    db.commit()

def addInventario(Prod, suma,idProd):

    query = "SELECT inventario FROM " + Prod
    mycursor.execute(query)

    result = mycursor.fetchone()

    db.commit()
    print("Inventario Viejo: " + str(result[0]))
    new_inventory = int(result[0]) + suma
    mycursor.execute("UPDATE producto SET inventario = %s WHERE idProducto = %s", (new_inventory, idProd))
    db.commit()

    query = "SELECT inventario FROM " + Prod
    mycursor.execute(query)

    result = mycursor.fetchone()

    print("Inventario actualizado: " + str(result[0]))

def verTabla(Prod):
    query = "SELECT * FROM " + Prod
    mycursor.execute(query)

    result = mycursor.fetchone()
    print(result)


# mycursor.execute("SELECT * FROM producto")
prod = 'producto'
prodID='p001'
# addInventario(prod, 5, prodID)
verTabla(prod)

