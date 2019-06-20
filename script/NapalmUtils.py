from napalm import get_network_driver
from napalm.ios import IOSDriver

def test_router_exist(username,password,secret,adress,os):

    optional_args = {'secret':secret}

    driver = get_network_driver(os)
    device =driver(adress,username,password,optional_args=optional_args)
    device.open()
    ret = device.is_alive()["is_alive"]
    print(os+" is alive "+str(ret))
    return ret
