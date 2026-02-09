# Microcontroller-Breadboards

Breadboards for Wide Microcontrollers

**NOTE:** This project is not finished until the BUGS.md file is finished and this note goes away. 2/6/2026

This project provides a custom 3D-printed breadboard body designed to accommodate modern, wide microcontroller development boards such as the **Raspberry Pi Pico**, **ESP32 Dev Board**, and **Arduino nano**, **ESP32-P4-WIFI6**. The metal spring contacts from a standard commercial breadboard are removed and reused inside the new housing, giving you a full-size 63×5 contact area and two power rails — just like the real thing.

## ✨ Why?

Many modern µC boards are too wide for typical solderless breadboards:

- With a **Raspberry Pi Pico** or **ESP32-P4-WIFI6**, only two holes per pin remain usable.
- With an **ESP32 Dev Board**, no holes remain at all — you need two breadboards side by side.
- With an **ESP8266 Dev Board**, only one hole per pin remain usable — you need two breadboards side by side.
- With an **TCA9548A Dev Board**, only two holes per pin remain usable — you need two breadboards side by side.

With this custom breadboard, the microcontroller sits in the middle, leaving **four free holes per pin** for jumper wires and components — ideal for prototyping.

## 📦 Features

- Full 63×5 breadboard layout
- 1/2 30×5 breadboard layout
- Mini 17×5 breadboard layout
- Two vertical power rails (left & right) (optional)
- Contact springs **recycled** from an existing breadboard
- Unlimited Variants
- Mouting Options
  - None / Double stick foam back
  - M2 Heat Insert
  - M2 Nut
  - Wood Screw
- Fully 3D-printable design (OpenSCAD source included)

## 📁 Included Files

This repository contains:

- /ESP32dev/                      – Source SCAD file, STL model, 3MF file for ESP32 development board
- /ESP8266dev/                    – Source SCAD file, STL model, 3MF file for ESP8266 development board
- /TCA9548Adev/                   – Source SCAD file, STL model, 3MF file for ESPTCA9548A development board
- /RaspberryPiPico/               – Source SCAD file, STL model, 3MF file for Raspberry Pi Pico / ESP32-P4-WIFI6
- /StandardBreadboards/           – Source SCAD file, STL model, 3MF file for Standard breakboards (Full, Half, Mini)
- /tests/                         – Source SCAD file, STL model, 3MF file for our test boards, excersizing versious sections of the library code
- /photos/                        – Build & assembly photos (for documentation)
- README.md                       - this file
- license.txt                     - license
- MicrocontrollerBreadboards.scad - This is the Microcontroller Breadboard Library
- BUGS.md                         - List of current know bugs
- TODO.md                         - List of current features we wish to add to the library

## 🖨 Printing Notes

- Material: **PLA** works well (ABS/ASA for heat resistance)
- Layer height: 0.2 mm recommended
- **nozzle diameter: 0.4 mm recommended**
- Infill: 50%
- Supports: Not required for main board (flip upside down to print)
- Optional: Bottom Plate (If not using a bottom plate, it is intended that you put on a double stick foam backing)
- Optional: Pause print to insert M2 nuts for screw mounting (If using a nut, my prefered version is the heat insert)

If you can't use the Heat Insert of Nut, then you may **glue** the bottom plate in.

## 🛠 Assembly Overview

1. Remove bottom adhesive tape from a commercial breadboard
2. Extract the metal spring contacts (keep power rails separate)
3. Insert contacts into the 3D-printed body
4. Insert power rails on both sides
5. Mount or glue the bottom plate
6. Plug in Pico/ESP32-P4-WIFI6, ESP32, ESP8266, or TCS9648A and start prototyping!

## 📷 Photos & Documentation

See the Instructables article for full build documentation and photos:  
*link coming soon*

## 📝 Inspiration & Credits

The concept was inspired by Fixing Breadboards for Wide Microcontrollers – Pico & ESP32 Edition on GitHub:  
[Fixing Breadboards for Wide Microcontrollers – Pico & ESP32 Edition](https://github.com/lhm0/wide-mcu-breadboard)
This version expands the idea to a **full-length 63-row breadboard** with **complete power rails**.

The concept was inspired by the MAKE Advent Calendar project on Tinkercad:  
[MAKE ESP Breadboard](https://www.tinkercad.com/things/bsXsvygyo6F-make-esp-breadboard)
This version expands the idea to a **full-length 63-row breadboard** with **complete power rails**.

## 📜 License

Creative Commons Attribution-NonCommercial-ShareAlike 4.0 (CC BY-NC-SA 4.0)
see license.txt
