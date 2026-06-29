# Event Tracking and Ticketing System 🎟️

## Overview
This project is a dynamic, scalable, and modern Event Ticketing Automation System developed for managing mass activities such as conferences, concerts, seminars, and graduation ceremonies. The primary objective is to securely maintain relational links between organizers, venues, events, attendees, tickets, and payments.

## Tech Stack
* **Backend Engine:** Python, MySQL, PyMySQL
* **Frontend (GUI):** CustomTkinter (Designed with an aesthetic pastel pink `#FFF5F7` and white tones)
* **Security:** `cryptography` package for `caching_sha2_password` protocol compatibility

## Database Architecture
Designed in accordance with Third Normal Form (3NF) standards. It features:
* **6 Core Entities:** Organizers, Venues, Events, Attendees, Tickets, and Payments.
* **Smart Database Triggers:** Real-time venue capacity enforcement that blocks ticket sales if the venue is full.
* **Dynamic Views:** Pre-compiled SQL views for instant Financial Summaries and Seat Availability reporting.

## Project By
* **Fatma Kıymazaslan** (Alanya University, Computer Engineering)
