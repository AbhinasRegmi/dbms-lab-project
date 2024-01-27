
import mysql.connector
from functools import lru_cache

# Creating connection object
# @lru_cache
# def connectTODB():
#     mydb = mysql.connector.connect(
#         host = "localhost",
#         user = "yourusername",
#         password = "your_password"
#     )
#     return mydb

# def executeQuery(mydb, query:str):
#     cursor = mydb.cursor()  
#     cursor.execute(query)
#     return cursor


db =  mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "abhinas"
) 
result = db.cursor()
print(result)
result.execute('Show databases;')
db.commit()
for i in result:
    print(i)
db.close()
