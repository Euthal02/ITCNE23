#!/usr/bin/python3
from etcd3 import client as etcd_client


def write_value(client_object, key_name, value_buffer):
    client_object.put(key_name, value_buffer)

def read_value(client_object, key_name):
    print(client_object.get(key_name))

client_connection = etcd_client()
write_value(client_connection, "test", "huuuuiiii")
read_value(client_connection, "test")