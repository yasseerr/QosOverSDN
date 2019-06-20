from PyQt5.QtCore import *
from PyQt5.QtWidgets import QDialog
from ui.ui_addRouterDialog import Ui_Dialog

from script.NapalmUtils import test_router_exist
class TopoDialog(QDialog):
    
    def __init__(self,devicesList:list):
        QDialog.__init__(self)
        self.ui = Ui_Dialog()
        self.ui.setupUi(self)

        self._devicesList = devicesList

        self.ui.quickWidget.rootContext().setContextProperty('dialogRef', self)
        self.ui.quickWidget.setSource(QUrl("qml/AddRouter.qml"))
    
    @pyqtSlot(str,str,str,str,str)
    def onAddRouterClicked(self,adress:str,username:str,password:str,secret:str,os:str):
        print("username : "+username)
        return test_router_exist(username,password,secret,adress,os)


