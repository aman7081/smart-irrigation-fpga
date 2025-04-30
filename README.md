# smart-irrigation-fpga
FPGA-based humidity monitoring and display system using Verilog and DHT11
# FPGA-Based Smart Irrigation Monitoring System

This project implements a **Verilog-based smart irrigation monitor** using an FPGA (Basys 3 board) and a **DHT11 sensor** to read humidity and temperature data. Based on the humidity level, the system determines whether irrigation is needed and displays the status (`'H'` for ON and `'-'` for OFF) on a 7-segment display.

> 📌 This project does not use any microcontroller, Arduino, or physical pump — it is a simulation + display logic system implemented entirely in hardware (FPGA).

---

## 🔧 Features

- ✅ Reads humidity and temperature from **DHT11** sensor
- ✅ Implements **FSM (Finite State Machine)** in Verilog
- ✅ Displays pump status on **Basys 3 7-segment display**
- ✅ Written entirely in Verilog HDL
- ✅ Synthesized and simulated in **Vivado 2021.2**

---

## 🧱 Project Structure

