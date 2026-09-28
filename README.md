# 5G Beamforming and Beam Steering Using MATLAB

A MATLAB-based simulation of beamforming and beam steering using a Uniform Linear Antenna Array (ULA) for mmWave 5G communication.

## 📌 Project Overview

Beamforming is an important technique used in modern wireless communication systems to direct transmitted or received signals toward a desired direction.

This project simulates a Uniform Linear Array (ULA) and demonstrates how phase control can steer the main beam toward different angles.

The simulation also investigates how the number of antenna elements affects the beam pattern and beamwidth.

## 🎯 Objectives

- Simulate beamforming using a Uniform Linear Antenna Array.
- Demonstrate beam steering toward different directions.
- Analyze beam patterns at 0°, 30°, and 60° steering angles.
- Study the effect of antenna array size on beamforming.
- Compare arrays containing 4, 8, and 16 antenna elements.

## 🛠️ Software Used

- MATLAB
- MATLAB Online

## 📡 Simulation Parameters

| Parameter | Value |
|---|---|
| Operating Frequency | 28 GHz |
| Application | mmWave 5G |
| Array Type | Uniform Linear Array (ULA) |
| Antenna Spacing | λ/2 |
| Steering Angles | 0°, 30°, 60° |
| Array Sizes | 4, 8, 16 elements |
| Angle Range | −90° to +90° |

## ⚙️ Beamforming Principle

The array factor of the antenna array is calculated by combining the contribution from each antenna element with an appropriate phase shift.

The phase shift is controlled according to the desired steering angle.

By changing the phase relationship between the antenna elements, the direction of the main beam can be changed.

### Concept

```text
                 Main Beam
                    ↗
                  ↗
                ↗
      ─────────────────────
       Antenna Array
       8 Elements

             Beam Steering
                  ↓
        Phase-controlled signals
