from database import *

db = connectTODB()
executeQuery(db,'SHOW Tables;')