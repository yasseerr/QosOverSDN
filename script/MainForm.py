# -*- coding: utf-8 -*-
import sys
from PyQt5.QtCore import QUrl,pyqtSlot,Qt,pyqtProperty,pyqtSignal
from PyQt5.QtWidgets import QWidget,QMainWindow
from PyQt5 import QtQuick,QtCore
from PyQt5.QtQml import QQmlContext
from PyQt5.QtGui import QPixmap,QBrush,QImage,QPainter

from script.ui_mainwindow import Ui_Form
from script.TopoDialog import TopoDialog
from script.DeviceItem import DeviceItem
from script.TopoScene import TopoScene
from script.models.QosClassManager import QosClassManager
from script.models.QosClassModel import QosClassModel,QosClass


import requests
import json
import random


class MainForm(QWidget):

    floodLightRequests = {
        "links":"//wm//topology//links//json"
    }
    controllerAdress = "http://192.168.60.130:8080"

    color_enum = ["#f00","#0f0","#00f","#ff0"]

    #!deprecated
    displayClasseSig = pyqtSignal(str,str,arguments=['name_p','color_p'])

    def __init__(self):
        QWidget.__init__(self)
        self.ui = Ui_Form()
        self.ui.setupUi(self)
        self.setWindowTitle("QosOnSdn")

        self._classesManager = QosClassManager()
        self._classesModel = QosClassModel(self)

        self.ui.menuWidget.rootContext().setContextProperty('mainForm',self)
        self.ui.topologieView.setRenderHint(QPainter.Antialiasing)
        self.drawTopologie()
        #self.ui.controleWidget.setVisible(False)
        self.ui.controleWidget.rootContext().setContextProperty('mainForm', self)
        self.ui.controleWidget.rootContext().setContextProperty('classesModel', self._classesModel)
        self.ui.controleWidget.setSource(QUrl("qml/classification.qml"))
        self.ui.topologieView.setVisible(False)
        
        self.topologyDialog = TopoDialog(self.topoScene.devices)
        



    @pyqtSlot()
    def exit_app(self):
        sys.exit()

    @pyqtSlot()
    def displayTopologie(self):
        self.ui.controleWidget.setVisible(False)
        self.ui.topologieView.setVisible(True)

    @pyqtSlot()
    def displayClassification(self):
        self.ui.topologieView.setVisible(False)
        self.ui.controleWidget.setVisible(True)

    @pyqtSlot()
    def drawTopologie(self):
        self.topoScene = TopoScene()
        self.ui.topologieView.setScene(self.topoScene)
        #ToDO get the topologie object
        linksArr = self.getObjectFromController("links")
        #TODO create the devices and links
        self.topoScene.createDevices(linksArr)
        #TODO add the items to the library
    
    @pyqtSlot()
    def showTopoDialogue(self):
        self.topologyDialog.show()
    



    def getObjectFromController(self,opperation:str):
        #result = requests.get((self.controllerAdress+self.floodLightRequests[opperation]))
        trafic = """
[
    {
        "src-switch": "00:00:00:00:00:00:00:01",
        "src-port": 2,
        "dst-switch": "00:00:00:00:00:00:00:02",
        "dst-port": 2,
        "type": "internal",
        "direction": "bidirectional",
        "latency": 1
    },
    {
        "src-switch": "00:00:00:00:00:00:00:02",
        "src-port": 3,
        "dst-switch": "00:00:00:00:00:00:00:03",
        "dst-port": 2,
        "type": "internal",
        "direction": "bidirectional",
        "latency": 1
    },
    {
        "src-switch": "00:00:00:00:00:00:00:03",
        "src-port": 3,
        "dst-switch": "00:00:00:00:00:00:00:04",
        "dst-port": 2,
        "type": "internal",
        "direction": "bidirectional",
        "latency": 1
    }
]
        """
        ret_obj = json.loads(trafic)
        print(ret_obj)
        return ret_obj
    
    #!deprecated
    @pyqtProperty(QosClassManager)
    def classesManager(self):
        return self._classesManager
    
    #!deprecated
    def exportClasses(self):
        for class_ob in self._classesManager.classes.values():
            self.displayClasseSig.emit(
                class_ob.name, random.choice(self.color_enum))











