
#! Deprecated

from script.models.QosClassModel import QosClass
import yaml

from PyQt5.QtCore import QObject


class QosClassManager(QObject):
    def __init__(self,parent=None):
        super().__init__(parent)
        self.classes = dict()

        # load classes from  Yaml file
        #self.loadClasses()
        #TODO publish classes to qml



    
    #TODO Save the classes function

