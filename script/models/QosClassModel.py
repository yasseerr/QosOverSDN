
from PyQt5.QtCore import QAbstractListModel,QModelIndex,Qt,QVariant
import yaml

class QosClass(object):

    def __init__(self,init_obj):
        self.name = init_obj["name"]
        self.classColor = init_obj["color"]


class QosClassModel(QAbstractListModel):
    QOS_NAME = Qt.UserRole +1
    QOS_COLOR = Qt.UserRole +2

    def __init__(self,parent =None):
        super().__init__(parent)
        self.qosClasses = list()
        self.loadClasses()
    
    def data(self,index : QModelIndex,role:int):
        rowNum = index.row()
        theQosClass : QosClass = self.qosClasses[rowNum]
        if(not index.isValid()):
            return QVariant()
        if(role == self.QOS_NAME):
            return theQosClass.name
        elif(role == self.QOS_COLOR):
            return theQosClass.classColor
        return "wallou"
    
    def rowCount(self, parent=None):
        return len(self.qosClasses)
    
    def roleNames(self):
        return {self.QOS_NAME: b'name', self.QOS_COLOR: b'classColor'}
    
    def loadClasses(self):
        f = open("data/QosClasses.yaml", "r")
        data_py = yaml.load(f)
        for class_obj in data_py:
            new_class = QosClass(class_obj)
            self.qosClasses.append(new_class)
    
