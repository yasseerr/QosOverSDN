

from napalm import get_network_driver
import json

def get_interfaces_ip(hostname,username,password,secret):
    driver = get_network_driver('ios')
    optional_args = {'secret': secret}

    iosvl2 = driver(hostname, username, password, optional_args=optional_args)
    iosvl2.open()

    interfacesIP = iosvl2.get_interfaces_ip()
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
            if (i == 4):
                listINT.append(s)
                s = []
                i == 0


    return listINT


