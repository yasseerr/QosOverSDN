

class Device(object):
    def __init__(self, dict_obj):
        self.id = dict_obj['id']
        self.username = dict_obj['username']
        self.password = dict_obj['password']
        self.secret = dict_obj['secret']
        self.ipAddr = dict_obj['ipAddr']
        self.neighborsIds = dict_obj['neighbors']
        self.os = dict_obj['os']
