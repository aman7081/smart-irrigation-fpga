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

---

## 📷 Output Behavior

| Humidity (%) | Pump Status | 7-Segment Display |
|--------------|--------------|--------------------|
| `< 40`       | ON           | `'H'`              |
| `>= 40`      | OFF          | `'-'`              |

---

## 💡 How It Works

1. **DHT11_Interface** module reads 40 bits from the DHT11 sensor.
2. Extracted humidity is sent to **FSM_Controller**.
3. FSM compares humidity against a threshold (40%).
4. If humidity is low → pump_status = 1 (ON) → `'H'` on display.
5. If humidity is high → pump_status = 0 (OFF) → `'-'` on display.

---

## 📍 Tools and Requirements

- Xilinx Vivado 2021.2
- Basys 3 FPGA Development Board
- DHT11 Sensor
- Verilog HDL

---

## 📌 Future Scope

1. Replace DHT11 with a capacitive soil moisture sensor.
2. Integrate actual pump control via relay module.
3. Add wireless (Wi-Fi/LoRa) remote monitoring support.
4. Expand to multi-zone irrigation systems.
5. Use solar power for off-grid deployment.

---

## 👨‍💻 Author
Aman Dubey    

