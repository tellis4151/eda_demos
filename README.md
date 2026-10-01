# ⚡ Event-Driven Ansible (EDA) Demos

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Ansible](https://img.shields.io/badge/Ansible-EDA-red.svg)](https://www.ansible.com/use-cases/event-driven-automation)
[![Status: Active](https://img.shields.io/badge/Status-Active-success.svg)]()

A collection of practical demonstrations, decision rulebooks, and playbooks showcasing **Event-Driven Ansible (EDA)** in action. This repository illustrates how to automate responses to real-time events, IT service management (ITSM) alerts, webhooks, and system telemetry.

---

## 🚀 Overview

**Event-Driven Ansible (EDA)** connects event sources (like webhooks, Kafka, monitoring tools, or syslog) with automated actions via **Ansible Rulebooks**. Rather than running scheduled tasks or manual interventions, EDA acts dynamically as events occur—enabling self-healing infrastructure, instant ticket remediation, and continuous compliance.

This repository serves as a sandbox and reference guide for building, testing, and deploying rulebooks locally or within **Red Hat Ansible Automation Platform (AAP)**.

---

## 🧠 How EDA Works

```text
  +------------------+         +--------------------+         +-------------------+
  |   Event Source   |  ---->  |  Ansible Rulebook  |  ---->  |  Automated Action |
  | (Webhook/Alert)  |         | (Condition Match)  |         | (Playbook/Job)    |
  +------------------+         +--------------------+         +-------------------+

├── rulebooks/             # Ansible Rulebook definitions (.yml)
│   ├── webhook_demo.yml   # Listen for HTTP/Webhook events
│   └── url_check_demo.yml # Monitor URL endpoint availability
├── playbooks/             # Remediation and execution playbooks triggered by rules
│   └── remediate.yml
├── inventory/             # Target host inventories
├── requirements.yml       # Ansible collections needed for EDA (ansible.eda)
└── README.md              # Project documentation

***

### Customization Options
If you have specific rulebooks or event sources (such as **Dynatrace**, **Kafka**, **PagerDuty**, or **Alertmanager**) already set up in this repo, let me know and I can add specific commands and configuration snippets tailored to them!
