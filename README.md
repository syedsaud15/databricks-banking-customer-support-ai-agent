# 🏦 Banking Customer Support AI Agent

An end-to-end AI-powered banking support system built on the Databricks Lakehouse Platform using a **Databricks Supervisor Agent** and **Unity Catalog Functions**.

The agent converts natural-language banking requests into tool calls, retrieves customer information from governed Unity Catalog data, and combines multiple results into a structured customer-support response.

## 🚀 Project Overview

Traditional banking support systems often require users or support teams to check account, transaction, and credit-card information separately.

This project demonstrates how an AI agent can orchestrate multiple governed banking tools and provide a unified response from a single natural-language request.

Example request:

> For customer CUST0001, provide a complete banking summary including the current account balance, recent transactions, and credit utilization. Also check the status and details of transaction TXN000219.

The Supervisor Agent determines which tools are required, executes the relevant Unity Catalog functions, and combines the results into one response.

## 🏗️ Architecture

```text
                    User
                      │
                      ▼
             Natural Language Query
                      │
                      ▼
        ┌───────────────────────────┐
        │ Databricks Supervisor    │
        │        Agent             │
        └─────────────┬─────────────┘
                      │
          Tool Selection & Routing
                      │
       ┌──────────────┼──────────────┐
       │              │              │
       ▼              ▼              ▼
 Account Balance   Transactions   Credit Utilization
    Function         Function         Function
       │              │              │
       └──────────────┼──────────────┘
                      │
                      ▼
             Transaction Status
                  Function
                      │
                      ▼
              Unity Catalog
                      │
                      ▼
          Governed Banking Data
                      │
                      ▼
             AI Generated Response
```

## 🧠 Agent Tools

The Supervisor Agent is connected to four Unity Catalog functions.

| Tool | Purpose |
|---|---|
| `get_customer_balance` | Retrieves account balance and account information |
| `get_recent_transactions` | Retrieves recent customer transactions |
| `calculate_credit_utilization` | Retrieves credit-card information and calculates utilization |
| `check_transaction_status` | Checks the status and details of a specific transaction |

These functions allow the agent to access structured banking data through controlled and reusable tools instead of directly querying arbitrary data.

## ⚙️ Agent Workflow

```text
User Request
     ↓
Supervisor Agent
     ↓
Understand Intent
     ↓
Select Required Tools
     ↓
Execute Unity Catalog Functions
     ↓
Retrieve Banking Data
     ↓
Combine Tool Results
     ↓
Generate Structured Response
```

For requests requiring multiple pieces of information, the Supervisor Agent can invoke multiple tools and synthesize their outputs into a single banking summary.

## 🛠️ Technology Stack

- Databricks Lakehouse Platform
- Databricks Supervisor Agent
- Databricks AI/ML Playground
- Unity Catalog
- Unity Catalog Functions
- Databricks SQL
- Model Serving Endpoint
- GitHub

## 📂 Repository Structure

```text
databricks-banking-customer-support-ai-agent/
│
├── sql/
│   └── setup_banking_ai.sql
│
└── README.md
```

### `sql/setup_banking_ai.sql`

Contains the Unity Catalog function definitions used as tools by the Supervisor Agent.

## 🧪 Example Capabilities

The agent can handle requests such as:

- Retrieve a customer's current account balance
- Display recent banking transactions
- Calculate credit-card utilization
- Check the status of a specific transaction
- Combine multiple banking operations into one customer summary

## 🤖 Supervisor Agent

The project uses a Databricks Supervisor Agent as the orchestration layer.

Instead of manually selecting a function, the user submits a natural-language request. The Supervisor Agent interprets the request and determines which available tools should be called.

For a complete banking-summary request, the agent can coordinate:

```text
get_customer_balance
        +
get_recent_transactions
        +
calculate_credit_utilization
        +
check_transaction_status
        ↓
Unified Banking Response
```

This demonstrates **tool calling, agent orchestration, governed data access, and multi-tool reasoning** within Databricks.

## 🌐 Deployment

The Supervisor Agent is deployed through a Databricks Model Serving endpoint.

The deployed endpoint enables the agent to be tested through Databricks Playground and provides a foundation for integration with external applications or customer-support interfaces.

## 🔐 Governance

Unity Catalog is used as the governance layer for the banking tools and underlying data resources.

Using Unity Catalog Functions provides a controlled interface between the AI agent and banking data while keeping tool definitions centrally managed within Databricks.

## 📊 Demonstrated Result

During testing, the deployed agent successfully combined multiple tool outputs to generate a customer banking summary containing:

- Account information and current balance
- Recent transaction history
- Credit-card details and utilization
- Transaction-specific status information
- Important account or transaction alerts

## 💡 Key Learning Outcomes

This project demonstrates practical experience with:

- Building AI agents on Databricks
- Creating tools with Unity Catalog Functions
- Connecting structured enterprise data to AI agents
- Supervisor-based tool orchestration
- Multi-tool function calling
- Natural-language interfaces for structured data
- Model Serving endpoint deployment
- AI application testing through Databricks Playground
- Governed enterprise AI architecture

## 🔮 Future Improvements

Potential production-oriented extensions include:

- Customer authentication and authorization
- Row-level access controls
- Audit logging and monitoring
- Knowledge Assistant integration for banking policies and FAQs
- Additional tools for loans, cards, disputes, and payments
- Frontend customer-support application
- Production API integration
- Automated agent evaluation and quality monitoring

## 👨‍💻 Author

**Syed Saud Alam**

Data Engineer | AI Engineer

GitHub: `syedsaud15`  
LinkedIn: `syed-saud-dev`

---

> This project uses simulated banking data for learning and demonstration purposes. It is not connected to a real banking system.
