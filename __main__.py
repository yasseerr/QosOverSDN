import os
import sys

from PyQt5.QtCore import QUrl,Qt
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQuick import QQuickView 
from PyQt5.QtGui import QGuiApplication,QIcon

from script.MainForm import MainForm
from script.DBView import DBView
if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setWindowIcon(QIcon("assets/appIcon.png"))
    w = MainForm()
    dbV = DBView(w)
    dbV.showMaximized()
    app.exec()
