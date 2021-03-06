from PyQt5.QtCore import *
from PyQt5.QtWidgets import QDialog
from ui.ui_addRouterDialog import Ui_Dialog

from script.NapalmUtils import *
from script.TopoScene import TopoScene
from script.DeviceItem import DeviceItem,LinkItem
from script.Device import Device
from script.models.DevicesModel import DeviceModel
class TopoDialog(QDialog):
    
    connectRespenseSig = pyqtSignal(int, arguments=['ret'])

    def __init__(self,topologieScene:TopoScene,deviceModel:DeviceModel,controleWidget):
        QDialog.__init__(self)
        self.ui = Ui_Dialog()
        self.ui.setupUi(self)
        self.deviceModel = deviceModel
        self.controleWidget = controleWidget
        self.topologieScene = topologieScene
        self.ui.quickWidget.rootContext().setContextProperty('dialogRef', self)
        self.ui.quickWidget.setSource(QUrl("qml/AddRouter.qml"))
    
    @pyqtSlot(str,str,str,str,str)
    def onAddRouterClicked(self,adress:str,username:str,password:str,secret:str,os:str):
        try:
            isAlive = test_router_exist(username, password, secret, adress, os)
            if(isAlive):
                print("router alive adding router...")
                nextId = 0
                if(len(self.topologieScene.devices)>0):
                    nextId = list(self.topologieScene.devices.keys())[-1]+1
                else:
                    nextId = 0
                newDevice: Device = Device({'id':nextId,'username': username, 'password': password, 'secret': secret, 'ipAddr': adress, 'neighbors':[],'os':os})
                print(str(newDevice))
                newDeviceItem  = DeviceItem(newDevice)
                # cheking neighbors2
                self.topologieScene.devices[nextId] = newDeviceItem
                self.topologieScene.addItem(newDeviceItem)
                for deviceI in self.topologieScene.devices.values():
                    if(deviceI.device.id==newDevice.id): continue
                    if(not check_adjacence(newDevice,deviceI.device)):
                        continue
                    newDevice.neighborsIds.append(deviceI.device.id)
                    deviceI.device.neighborsIds.append(newDevice.id)
                    newLink = LinkItem(newDeviceItem,deviceI)
                    deviceI.neighbors.append(newDeviceItem)
                    newDeviceItem.neighbors.append(deviceI)
                    deviceI.links.append(newLink)
                    newDeviceItem.links.append(newLink)
                    self.topologieScene.addItem(newLink)
                    self.ui.controleWidget.rootContext().setContextProperty('deviceModel', self._deviceModel)
                    self.topologieScene.links.append(newLink)
                self.topologieScene.buildGraph()
                self.topologieScene.saveTopologie()
                self.deviceModel.devicesList.append(newDevice)
                con
                self.connectRespenseSig.emit(1)
        except Exception  :
            print(" error connecting to router  ")
            self.connectRespenseSig.emit(0)


