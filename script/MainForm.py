# -*- coding: utf-8 -*-
import sys
from PyQt5.QtCore import QUrl,pyqtSlot
from PyQt5.QtWidgets import QWidget,QMainWindow
from PyQt5 import QtQuick,QtCore
from PyQt5.QtQml import QQmlContext
from script.ui_mainwindow import Ui_Form
class MainForm(QWidget):
    def __init__(self):
        QWidget.__init__(self)
        self.ui = Ui_Form()
        self.ui.setupUi(self)
        self.setWindowTitle("QosOnSdn")
        self.ui.menuWidget.rootContext().setContextProperty('mainForm',self)
    
    @pyqtSlot()
    def exit_app(self):
        sys.exit()
        











