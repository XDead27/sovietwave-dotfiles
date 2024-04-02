#!/bin/pyhon3

import rofi_menu
import subprocess

class PowerOffAndExitItem(rofi_menu.Item):
    async def on_select(self, meta):
        os.system('bluetoothctl power off')
        return rofi_menu.Operation(rofi_menu.OP_EXIT)

class PowerOffMenu(rofi_menu.Menu):
    prompt = "Turn Off"
    items = [
        rofi_menu.ShellItem("Yes", "bluetoothctl power off", flags={rofi_menu.FLAG_STYLE_URGENT}),
        rofi_menu.ExitItem("No", flags={rofi_menu.FLAG_STYLE_ACTIVE}),
    ]

class MainMenu(rofi_menu.Menu):
    prompt = "menu"
    items = [] 

if __name__ == "__main__":
    BTMenu = MainMenu();

    get_devices_bash = "bluetoothctl devices | cut -c 26-"
    p1 = subprocess.Popen(['bluetoothctl','devices'],stderr=subprocess.PIPE, universal_newlines=True,stdout=subprocess.PIPE)
    p2 = subprocess.Popen(["cut", "-c", "26-"], stdin=p1.stdout, stdout=subprocess.PIPE)
    output, error = p2.communicate()
    
    p1 = subprocess.Popen(['bluetoothctl','devices'],stderr=subprocess.PIPE, universal_newlines=True,stdout=subprocess.PIPE)
    p3 = subprocess.Popen(["""awk '{print $2;}'"""], stdin=p1.stdout, stdout=subprocess.PIPE, shell=True)
    mac_output, mac_error = p3.communicate()

    output = bytes.decode(output).split("\n")
    mac_output = bytes.decode(mac_output).split("\n")

    for i in range(len(output)):
        if len(output[i]) > 0:
            BTMenu.items.append(rofi_menu.ShellItem(output[i], "bluetoothctl connect " + mac_output[i], flags={rofi_menu.FLAG_STYLE_URGENT}))

    BTMenu.items.append(rofi_menu.NestedMenu(" Turn Off", PowerOffMenu()))
    rofi_menu.run(BTMenu, rofi_version="1.6")  # change to 1.5 if you use older rofi version
