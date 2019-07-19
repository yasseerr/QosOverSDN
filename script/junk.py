from PyQt5 import QtCore,QtSql
from PyQt5.QtChart import QChartView,QChart,QPieSeries,QLineSeries
import napalm
import yaml
#print(QtCore.__version__)
#print("{:12} {:<10}".format("yaya","123456"))

#topo = TopoScene()

#a:QtCore.QRectF = None

#p1 = QtCore.QPointF(10,20)
#p2 = QtCore.QPointF(30,40)
#p3 = p1+p2
"""
driver  = napalm.get_network_driver("ios")
router1 : napalm.ios.IOSDriver  = driver("10.0.0.2","yasser","p2019")
router1.open()

print(router1.get_facts())
print(router1.get_interfaces())
"""

"""
f = open("data\QosClasses.yaml", "r")
data_py = yaml.load(f)
print(data_py)

"""

"""
driver  = napalm.get_network_driver("ios")
router1 : napalm.ios.IOSDriver  = driver("13.0.0.1","projet2019","projet2019",optional_args={'secret':'projet2019'})
router1.open()

print(router1.get_facts())
print(router1.get_interfaces())
"""
"""
driver = napalm.get_network_driver("ios")
router1: napalm.ios.IOSDriver = driver("13.0.0.3", "projet2019", "projet2019", optional_args={'secret': 'projet2019'})
router1.open()

print(router1.get_facts())
print(router1.get_interfaces())
"""

db = QtSql.QSqlDatabase.addDatabase('QSQLITE')
db.setDataBaseName()

