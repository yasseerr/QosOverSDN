from PyQt5.QtCore import QUrl
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQuick import QQuickView
import os,sys

from script.MainForm import MainForm

if __name__ == "__main__":

    app = QApplication(sys.argv)
    w =  MainForm()
    w.showMaximized()
    app.exec()