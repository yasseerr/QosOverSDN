# -*- coding: utf-8 -*-
import sys
from PyQt5.QtCore import QUrl,pyqtSlot,Qt
from PyQt5.QtWidgets import QWidget,QMainWindow
from PyQt5 import QtQuick,QtCore
from PyQt5.QtQml import QQmlContext
from PyQt5.QtGui import QPixmap,QBrush,QImage,QPainter

from script.ui_mainwindow import Ui_Form
from script.DeviceItem import DeviceItem
from script.TopoScene import TopoScene

import requests
import json


class MainForm(QWidget):

    floodLightRequests = {
        "links":"//wm//topology//links//json"
    }
    controllerAdress = "http://192.168.60.130:8080"
    def __init__(self):
        QWidget.__init__(self)
        self.ui = Ui_Form()
        self.ui.setupUi(self)
        self.setWindowTitle("QosOnSdn")
        self.ui.menuWidget.rootContext().setContextProperty('mainForm',self)
        self.ui.topologieView.setRenderHint(QPainter.Antialiasing)
        self.drawTopologie()

    @pyqtSlot()
    def exit_app(self):
        sys.exit()

    @pyqtSlot()
    def drawTopologie(self):
        self.topoScene = TopoScene()
        self.ui.topologieView.setScene(self.topoScene)
        #ToDO get the topologie object
        linksArr = self.getObjectFromController("links")
        #TODO create the devices and links
        self.topoScene.createDevices(linksArr)
        #TODO add the items to the library

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










