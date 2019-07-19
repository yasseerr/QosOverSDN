from napalm import get_network_driver
from napalm.ios import IOSDriver
from script.Device import Device
import json

from script import Device


def test_router_exist(username,password,secret,adress,os):

    optional_args = {'secret':secret}

    driver = get_network_driver(os)
    device =driver(adress,username,password,optional_args=optional_args)
    device.open()
    ret = device.is_alive()["is_alive"]
    print(os+" is alive "+str(ret))
    return ret

def get_interfaces_ip(hostname,username,password,secret,os):
    driver = get_network_driver(os)
    optional_args = {'secret': secret}

    iosvl2 = driver(hostname, username, password, optional_args=optional_args)
    iosvl2.open()

    interfacesIP = iosvl2.get_interfaces_ip()
    print(interfacesIP)
    stringJSON = json.dumps(interfacesIP)
    table = stringJSON.split(",")
    listINT = []
    for x in table:
        y = x.split(":")
        i = 0
        s = []
        for z in y:
            e = z.split('"')
            i = i + 1
            if (i == 1 or i == 3):
                s.append(e[1])
            if (i == 5):
                t = e[0].split("}")
                t2=t[0]
                s.append(int(t2[1:]))
                listINT.append(s)
                s = []
                i == 0
    return listINT

def check_adjacence(x: Device,y:Device):
    interfacesX = get_interfaces_ip(x.ipAddr,x.username,x.password,x.secret,x.os)
    interfacesY = get_interfaces_ip(y.ipAddr,y.username,y.password,y.secret,y.os)
    print(interfacesX)
    print(interfacesY)

    T=False
    for xx in interfacesX:
        for yy in interfacesY:
            if (xx[2]==yy[2]):
                masq = xx[2] / 8
                masq = int(masq)
                X = xx[1].split(".")
                Y = yy[1].split(".")
                t = True
                for i in range(masq):
                    if not(X[i] == Y[i]):
                        t = False
                if(t==True):T=True
    return T

def send_config_file(f:str,device:Device):
    driver = get_network_driver(device.os)
    optional_args = {'secret': device.secret,
                     'inline_transfer':True}

    dev = driver(device.hostname, device.username, device.password, optional_args=optional_args)
    dev.open()
    try:
        dev.load_merge_candidate(f)
        defferences = dev.compare_config()
        if len(defferences)>0:
            print(defferences)
            dev.commit_config()
        else:
            dev.discard_config()
    except:
        print("Ther is a problem with send the configuration file")

    dev.close()





