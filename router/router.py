from fastapi import APIRouter
from config.db import conn 
import pandas as pd
import mysql.connector as myconn
from mysql.connector import Error
import os
from config.db import meta 
os.system("cls")



user= APIRouter()


@user.post("/Saludos desde API-Platforms APP")
async def Saludo():
    return "Gracias por curiosear aquí"

@user.post("/api/Answer1/{anio}/{plataforma}/{min}")
async def get_max_duration(anio, plataforma, min):
        
    query = f'select maxdurationfilm(%s, %s, %s)'  
   
    df = pd.read_sql(query,conn,params=[anio, plataforma, min],index_col=None)
    
    
    titulo = ''
    for column_name, item in df.iteritems():
        titulo = item[0]
    
    return {f"Título de la película: {titulo}"}


@user.post("/api/Answer2/{plataforma}") 
async def get_count_plataform(plataforma):

    co = myconn.connect(host="localhost",
                            database="platforms_app",
                            user="root",
                            password="Daniela123#")
    
    try:

        if co.is_connected():                                    
            cursor = co.cursor()

            params=[plataforma, '', 0, 0]

            data = cursor.callproc('showcount', params)
     
            co.commit()

            return {f'La plataforma: {data[1]},cuenta con {data[2]} películas y {data[3]} TV Shows'}

    except Error as ex:
        return "Error durante la conección:", ex
    finally:
        if co.is_connected():
           co.close()

@user.post("/api/Answer3/{genero}") 
async def get_listedin(genero):        

    co = myconn.connect(host="localhost",
                            database="platforms_app",
                            user="root",
                            password="Daniela123#")
    
    try:

        if co.is_connected():                                    
            cursor = co.cursor()

            params=[genero, '', 0]

            data = cursor.callproc('getlisted', params)
     
            co.commit()

            return {f'Plataforma: {data[1]}, Cantidad: {data[2]}'}

    except Error as ex:
        return "Error durante la conección:", ex
    finally:
        if co.is_connected():
           co.close()


