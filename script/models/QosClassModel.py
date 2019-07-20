
from PyQt5.QtCore import *
import yaml

class QosClass(object):

    def __init__(self, init_obj):
        self.name = init_obj.get('name',"not_set")
        self.description = init_obj.get('description',"not_set")
        self.match = init_obj.get('match',"not_set")
        self.protocoles = init_obj.get('protocoles',[])
        self.precedence = init_obj.get('precedence',"not_set")
        self.dscp = init_obj.get('dscp',"not_set")
        self.interfaceType = init_obj.get('interfaceType',"not_set")
        self.interfaceIndex1 = init_obj.get('interfaceIndex1',0)
        self.interfaceIndex2  = init_obj.get('interfaceIndex2',0)
        self.macAddr =init_obj.get('macAddr',"not_set")
        self.classColor = init_obj.get("color", "#336699")
    
    def get_dict(self):
        return  {
            'name': self.name,
            'description': self.description,
            'match': self.match,
            'protocoles': self.protocoles,
            'precedence': self.precedence,
            'dscp':self.dscp,
            'interfaceType': self.interfaceType,
            'interfaceIndex1': self.interfaceIndex1,
            'interfaceIndex2': self.interfaceIndex2,
            'macAddr': self.macAddr,
            'color': self.classColor
        }


class QosClassModel(QAbstractListModel):
    QOS_NAME = Qt.UserRole +1
    QOS_COLOR = Qt.UserRole +2
    QOS_DESCRIPTION = Qt.UserRole + 3
    QOS_MATCH = Qt.UserRole + 4
    QOS_PROTOCOLES = Qt.UserRole + 5
    QOS_PRECEDENCE = Qt.UserRole + 6
    QOS_DSCP = Qt.UserRole + 7
    QOS_INTERFACE = Qt.UserRole + 8
    QOS_MAC = Qt.UserRole + 9

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
        elif(role == self.QOS_DESCRIPTION):
            return theQosClass.description
        elif(role == self.QOS_MATCH):
            return theQosClass.match
        elif(role == self.QOS_PROTOCOLES):
            return theQosClass.protocoles
        elif(role == self.QOS_PRECEDENCE):
            return theQosClass.precedence
        elif(role == self.QOS_DSCP):
            return theQosClass.dscp
        elif(role == self.QOS_INTERFACE):
            return theQosClass.interfaceType+str(theQosClass.interfaceIndex1)+"\\"+str(theQosClass.interfaceIndex2)
        elif(role == self.QOS_MAC):
            return theQosClass.macAddr
        return "wallou"
    
    def rowCount(self, parent=None):
        return len(self.qosClasses)
    
    def roleNames(self):
        return {
            self.QOS_NAME: b'name', 
            self.QOS_COLOR: b'classColor',
            self.QOS_DESCRIPTION: b'description',
            self.QOS_MATCH: b'match',
            self.QOS_PROTOCOLES: b'protocoles',
            self.QOS_PRECEDENCE: b'precedence',
            self.QOS_INTERFACE: b'interfaceRole',
            self.QOS_MAC: b'mac',
            }
    
    def loadClasses(self):
        f = open("data/QosClasses.yaml", "r")
        data_py = yaml.load(f)
        for class_obj in data_py:
            new_class = QosClass(class_obj)
            self.qosClasses.append(new_class)
    
    @pyqtSlot(str,str,str,list,str,str,str,int,int,str)
    def addQosClass(self, name,description,match,protocoles,precedence,dscp,interfaceType,interfaceIndex1,interfaceIndex2,macAddr):
        init_obj ={
            'name':name,
            'description':description,
            'match':match,
            'protocoles':protocoles,
            'precedence':precedence,
            'dscp':dscp,
            'interfaceType':interfaceType,
            'interfaceIndex1':interfaceIndex1,
            'interfaceIndex2':interfaceIndex2,
            'macAddr':macAddr
        }
        newQosClass = QosClass(init_obj)
        self.qosClasses.append(newQosClass)
        self.saveModel()
    
    def saveModel(self):
        f = open("data/QosClasses.yaml",'w')
        to_dump = []
        for qos_class in self.qosClasses:
            to_dump.append(qos_class.get_dict())
        f.write(yaml.dump(to_dump))
        f.close()
        
