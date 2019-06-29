
from PyQt5.QtCore import QAbstractListModel,QModelIndex,Qt,QVariant
import yaml

class QosPolicy(object):

    def __init__(self,init_obj):
        self.name = init_obj["name"]
        self.policyColor = init_obj["color"]


class QosPoliciesModel(QAbstractListModel):
    QOS_NAME = Qt.UserRole +1
    QOS_COLOR = Qt.UserRole +2

    def __init__(self,parent =None):
        super().__init__(parent)
        self.qosPolicies = list()
        self.loadPolicies()
    
    def data(self,index : QModelIndex,role:int):
        rowNum = index.row()
        theQosPolicy : QosPolicy = self.qosPolicies[rowNum]
        if(not index.isValid()):
            return QVariant()
        if(role == self.QOS_NAME):
            return theQosPolicy.name
        elif(role == self.QOS_COLOR):
            return theQosPolicy.policyColor
        return "wallou"
    
    def rowCount(self, parent=None):
        return len(self.qosPolicies)
    
    def roleNames(self):
        return {self.QOS_NAME: b'name', self.QOS_COLOR: b'policyColor'}
    
    def loadPolicies(self):
        f = open("data/QosPolicies.yaml", "r")
        data_py = yaml.load(f)
        for policy_obj in data_py:
            new_policy = QosPolicy(policy_obj)
            self.qosPolicies.append(new_policy)
    
