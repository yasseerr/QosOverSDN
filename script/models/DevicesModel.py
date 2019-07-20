
import yaml
from PyQt5.QtCore import *

from script.TopoScene import TopoScene,DeviceItem,Device

class DeviceModel(QAbstractListModel):
    QOS_NAME = Qt.UserRole + 1
    QOS_ID = Qt.UserRole + 2
    updateModelSig = pyqtSignal()

    def __init__(self,topoScene,parent=None):
        super().__init__(parent)
        self.devicesList = list()
        self.topoScene = topoScene
        self.loadDevices()

    def data(self, index: QModelIndex, role: int):
        rowNum = index.row()
        theDevice: Device = self.devicesList[rowNum]
        if(not index.isValid()):
            return QVariant()
        if(role == self.QOS_NAME):
            return theDevice.ipAddr
        elif(role == self.QOS_ID):
            return theDevice.id
        return "wallou"

    def rowCount(self, parent=None):
        return len(self.devicesList)

    def roleNames(self):
        return {
            self.QOS_NAME: b'name',
            self.QOS_ID: b'deviceId',
        }

    def loadDevices(self):
        for deviceI in self.topoScene.devices.values():
            dev_tmp:Device = deviceI.device
            self.devicesList.append(dev_tmp)
