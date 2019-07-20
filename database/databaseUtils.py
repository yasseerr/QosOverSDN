

from PyQt5 import QtSql,QtGui
import sqlite3

def create_DB():
    db = QtSql.QSqlDatabase.addDatabase('QSQLITE')
    db.setDatabaseName('QosUsers')

    if not db.open():
            QtGui.QMessageBox.critical(None, QtGui.qApp.tr("Cannot open database"),
                                       QtGui.qApp.tr("Unable to establish a database connection.\n"
                                                     "This example needs SQLite support. Please read "
                                                     "the Qt SQL driver documentation for information "
                                                     "how to build it.\n\n" "Click Cancel to exit."),
                                       QtGui.QMessageBox.Cancel)

            return False
    query = QtSql.QSqlQuery()

    query.exec_("create table users(id INTEGER PRIMARY KEY, ""username varchar(20), password varchar(20))")


    return True







def add_user(name:str,password:str):
    conn = sqlite3.connect("QosUsers")
    cursor = conn.cursor()
    cursor.execute("insert into users VALUES (null,?,?) ",(name,password))
    conn.commit()



def log_in(name:str,password:str):
    T = True
    conn = sqlite3.connect("QosUsers")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users where username = ? and password = ?",(name,password))
    data = cursor.fetchall()
    print(data)
    if (len(data)==0):
        T = False
    return T


# for the test : print(log_in("otman","otman"))
# for the test : print(log_in("yaser","yaser"))
