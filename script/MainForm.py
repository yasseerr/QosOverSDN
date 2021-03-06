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
from script.models.QosPoliciesModel import QosPoliciesModel,QosPolicy
from script.models.DevicesModel import DeviceModel,Device


from script.JinjaUtils import *
from script.NapalmUtils import *

import requests
import json
import yaml
import os
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
        self._classesModel = QosClassModel(self.ui.controleWidget, self)
        self._policiesModel = QosPoliciesModel(self.ui.controleWidget, self)
        self.ui.menuWidget.rootContext().setContextProperty('mainForm',self)
        self.ui.topologieView.setRenderHint(QPainter.Antialiasing)
        self.drawTopologie("topo1.yaml")
        self.ui.controleWidget.setVisible(True)
        self.ui.controleWidget.rootContext().setContextProperty('mainForm', self)
        self.ui.controleWidget.rootContext().setContextProperty('classesModel', self._classesModel)
        self.ui.controleWidget.rootContext().setContextProperty('policiesModel', self._policiesModel)
        self.ui.controleWidget.setSource(QUrl("qml/Classification.qml"))
        self.ui.topologieView.setVisible(False)
        



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
        self.ui.controleWidget.setSource(QUrl("qml/Classification.qml"))
        self.ui.controleWidget.setVisible(True)

    @pyqtSlot()
    def displayPolicing(self):
        self.ui.topologieView.setVisible(False)
        self.ui.controleWidget.setSource(QUrl("qml/policing.qml"))
        self.ui.controleWidget.setVisible(True)

    @pyqtSlot()
    def displayAutoQos(self):
        self.ui.topologieView.setVisible(False)
        self.ui.controleWidget.setSource(QUrl("qml/AutoQos.qml"))
        self.ui.controleWidget.setVisible(True)


    @pyqtSlot()
    def displayServicePolicing(self):
        self.ui.topologieView.setVisible(False)
        self.ui.controleWidget.setSource(QUrl("qml/ServicePolicing.qml"))
        self.ui.controleWidget.setVisible(True)

    @pyqtSlot(str)
    def drawTopologie(self,topoFile):
        self.topoScene = TopoScene("data/topologies/"+topoFile)
        self.ui.topologieView.setScene(self.topoScene)
        self._deviceModel = DeviceModel(self.topoScene)
        self.ui.controleWidget.rootContext().setContextProperty('deviceModel', self._deviceModel)
        self.topologyDialog = TopoDialog(self.topoScene,self._deviceModel,self.ui.controleWidget)
        self.topologyDialog.topologieScene = self.topoScene
        self.displayTopologie()


    
    @pyqtSlot()
    def showTopoDialogue(self):
        self.topologyDialog.show()
    
    @pyqtSlot()
    def openTopologieView(self):
        self.ui.topologieView.setVisible(False)
        self.ui.controleWidget.setSource(QUrl("qml/OpenTopologie.qml"))
        self.ui.controleWidget.setVisible(True)

    @pyqtSlot(str)
    def addTopologie(self,filename):
        f = open("data/topologies/"+filename+".yaml",'w')
        init_obj = {"name":filename,"devices":[]}
        f.write(yaml.dump(init_obj))
        f.close()
        self.drawTopologie(filename+".yaml")
    
    @pyqtSlot(str)
    def deleteTopologie(self, filename):
        fileP = "data/topologies/"+filename
        os.remove(fileP)

    @pyqtSlot(int,str,int,int)
    def applyAutoQos(self, deviceId,interfaceType,index1,index2):
        device: Device = self.topoScene.devices[deviceId].device
        autoQosJinja(interfaceType,index1,index2)
        send_config_file("autoqos.cfg", device)

    @pyqtSlot(int,str)
    def applyClassificaionToRouter(self, deviceId,className):
        device:Device = self.topoScene.devices[deviceId].device
        qos_class: QosClass = self._classesModel.getClassByName(className) 
        classification(qos_class)
        send_config_file("classification.cfg",device)

    @pyqtSlot(int,str)
    def applyPolicyToRouter(self, deviceId,policyName):
        device:Device = self.topoScene.devices[deviceId].device
        qos_policy: QosPolicy = self._policiesModel.getPolicyByName(policyName)
        policingJija(qos_policy)
        send_config_file("policing.cfg",device)

    @pyqtSlot(int,str,int,int,str,str)
    def applyServicePolicingToRouter(self, deviceId, interfaceType, itrIndex1, itrIndex2, orientation, policyName):
        device:Device = self.topoScene.devices[deviceId].device
        servicePolicyJija(interfaceType,itrIndex1,itrIndex2,orientation,policyName)
        send_config_file("servicePolicing.cfg", device)
    



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











