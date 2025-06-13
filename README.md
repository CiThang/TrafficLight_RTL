# 🚦 Traffic Light Controller (Verilog)

This project implements a **traffic light controller** in Verilog, simulating a real-world traffic light system with red, yellow, and green lights, along with a 7-segment display to show the remaining time for each light.

---

![image](https://github.com/user-attachments/assets/22b67d8a-2496-452f-97d7-29e328cdaad8)


## 📦 Module Overview

The system is composed of four main modules:

### 1. `Clock Divider - clock_divider.v`
- **Function**: Divides the input 10MHz clock down to 1Hz for human-perceivable timing.
- **Input**: `clk` (10MHz)
- **Output**: `clk_1Hz`
- **Result**
![image](https://github.com/user-attachments/assets/9c697f09-e145-496e-a534-905a16bb2daa)
### 2. `State Machine - traffic_fsm_single.v`
- **Function**: Controls the light states (red, yellow, green) based on a timed sequence.
- **States and Durations**:
  - 🔴 Red: 18 seconds
  - 🟡 Yellow: 3 seconds
  - 🟢 Green: 15 seconds
- **Inputs**: `clk_1Hz`, `rst_n`, `en`
- **Outputs**:
  - `red_light`
  - `yellow_light`
  - `green_light`
  - `timer_value` (passed to segment_display.v )
- **Result**
![image](https://github.com/user-attachments/assets/bcb517ee-683f-4660-96a1-426c0e1d0046)
### 3. `7-Segment Display Controller - segment_display.v`
- **Function**: Converts `count_value` to a 2-digit 7-segment format for display.
- **Input**: `timer_value`
- **Output**: `display_led[15:0]` (for 2 digits × 7 segments + dot points)

---

## 📐 Top Module Port Description

| Port Name     | Direction | Width | Description                           |
|---------------|-----------|--------|---------------------------------------|
| `clk`         | input     | 1      | 10MHz system clock                    |
| `rst_n`       | input     | 1      | Active-low asynchronous reset         |
| `en`          | input     | 1      | Enable signal                         |
| `red_light`   | output    | 1      | Control signal for red light          |
| `yellow_light`| output    | 1      | Control signal for yellow light       |
| `green_light` | output    | 1      | Control signal for green light        |
| `display_led` | output    | 16     | Two-digit 7-segment display output    |

---

## 🛠️ Specifications

- **Clock Frequency**: 10MHz
- **Red Light Duration**: 18 seconds  
- **Yellow Light Duration**: 3 seconds  
- **Green Light Duration**: 15 seconds  
- **Display**: 2-digit 7-segment LED display

---

## 🧠 Behavior

1. At startup, the system begins in the **Red** state for 18 seconds.
2. Transitions to **Green** for 15 seconds.
3. Then to **Yellow** for 3 seconds.
4. The cycle repeats endlessly.
5. The remaining time for each light is displayed on the 7-segment display.

---

## 💡 Notes

- The system is fully synchronous with the 1Hz derived clock.
- All transitions are based on time values programmed into the FSM.
- Display uses binary to 7-segment conversion logic.

---

## 📷 Block Diagram

![image](https://github.com/user-attachments/assets/5d2a7600-d466-4831-9e55-b38e0f139482)


---
## Result
![image](https://github.com/user-attachments/assets/d35c8919-9fb3-4439-a194-2de4f071d3be)

---
## 🔁 Future Improvements
- Add pedestrian crossing logic.
- Support for night mode or flashing yellow.
- Implement testbench and simulation scripts.

