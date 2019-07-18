from PyQt5.QtCore import QUrl,QRectF,Qt
from PyQt5.QtWidgets import QGraphicsScene,QGraphicsView
from PyQt5.QtGui import QImage,QPixmap,QBrush,QColor
from script.DeviceItem import DeviceItem,LinkItem
from script.Device import Device
import yaml
import networkx as nx

class TopoScene(QGraphicsScene):
    def __init__(self,topoFile):
        super().__init__()
        self.bgImage = QImage("assets/bg_brush2.png")
        self.setBackgroundBrush(QBrush(self.bgImage))
        #self.setSceneRect(QRectF(0,0,600,600))
        #TODO initialise the items
        self.devices = {}
        self.links = []
        self.name = "topologieName"
        self.createDevicesFromYaml(topoFile)
        self.createLinks()
        self.graph = nx.Graph()
        self.buildGraph()

    def createDevicesFromYaml(self,fileName:str):
        topoFile = open(fileName,'r')
        topoDict = yaml.load(topoFile)
        self.name = topoDict['name']
        for deviceDict in topoDict["devices"]:
            newDevice = Device(deviceDict)
            newDeviceItem = DeviceItem(newDevice)
            newDeviceItem.setPos(len(self.devices)*200,300)
            self.devices[newDevice.id] = newDeviceItem
            self.addItem(newDeviceItem)
    
    def createLinks(self):
        for deviceItem in self.devices.values():
            sourceDevice :DeviceItem  = deviceItem
            for deviceIndex in sourceDevice.device.neighborsIds:
                destinationDevice : DeviceItem = self.devices[deviceIndex]
                if(sourceDevice.neighbors.__contains__(destinationDevice)): 
                    continue
                newLink : LinkItem = LinkItem(sourceDevice,destinationDevice)
                sourceDevice.links.append(newLink)
                destinationDevice.links.append(newLink)
                sourceDevice.neighbors.append(destinationDevice)
                destinationDevice.neighbors.append(sourceDevice)
                self.links.append(newLink)
                self.addItem(newLink)
    def buildGraph(self):
        self.graph.clear()
        if(len(self.devices)<1):return
        for deviceIndex in self.devices.keys():
            self.graph.add_node(deviceIndex)
        for link in self.links:
            self.graph.add_edge(link.src.device.id, link.des.device.id)
        positions = nx.kamada_kawai_layout(self.graph,scale=len(self.devices)*50)
        for posKey in positions.keys():
            thePosition = positions[posKey]
            deviceI : DeviceItem = self.devices[posKey]
            deviceI.setPos(thePosition[0],thePosition[1])
            deviceI.update()
        for linkItem  in self.links:
            linkItem.updateLine() 
            linkItem.update()
    
    def saveTopologie(self):
        #TODO save the topologie into yaml file 
        pass


    #! deprecaed
    def createDevices(self, linkList:list):
        for linkObj in linkList:
            src_name = linkObj["src-switch"]
            dst_name = linkObj["dst-switch"]

            srcDevice:DeviceItem = None
            dstDevice:DeviceItem = None

            if(self.devices.__contains__(src_name)):
                srcDevice = self.devices[src_name]
            else:
                srcDevice = DeviceItem(name=src_name)
                self.devices[src_name] = srcDevice
                srcDevice.setPos(len(self.devices)*200,300)

            if(self.devices.__contains__(dst_name)):
                dstDevice = self.devices[dst_name]
            else:
                dstDevice = DeviceItem(name=dst_name)
                self.devices[dst_name] = dstDevice
                dstDevice.setPos(len(self.devices)*200,300)
            link = LinkItem(srcDevice,dstDevice)
            self.links.append(link)

            srcDevice.links.append(link)
            dstDevice.links.append(link)

            self.addItem(link)
            self.addItem(srcDevice)
            self.addItem(dstDevice)
        

