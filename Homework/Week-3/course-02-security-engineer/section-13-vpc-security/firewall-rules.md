This is arguably the most important section for your **SEIR-I** (Identity Responsibility) portfolio. In a professional setting, firewall management is often the first line of defense. Use this template to show that you don't just "open ports," but that you design **security policies**.

---

# `firewall-rules/README.md` Template

## ## Project Overview: Perimeter Security & Ingress Control
**Course Reference:** Professional Cloud Security Engineer - Section 13
**Lab Objective:** [e.g., "Implementing a Zero-Trust firewall strategy using network tags and service accounts to enforce least-privilege access."]

---

## ## Firewall Policy Architecture

> *Note: Create a diagram showing your 'Deny All' baseline and specific 'Allow' holes for traffic.*

---

## ## Firewall Rule Definitions (Rule Ledger)
| Rule Name | Direction | Action | Priority | Target Tags / SA | Protocol/Port |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `[e.g., allow-hc-lb]` | Ingress | Allow | 1000 | `[tag: web-server]` | TCP: 80, 443 |
| `[e.g., deny-all-egress]` | Egress | Deny | 65535 | `All Instances` | All |
| `[e.g., allow-iap-ssh]` | Ingress | Allow | 1000 | `[tag: mgmt-vm]` | TCP: 22 |

---

## ## SEIR-I Security Hardening Standards
*Explain the "Systems Engineering" logic behind your configuration.*

### ### 1. Implicit vs. Explicit Rules
* **Baseline Strategy:** [Explain why you chose a 'Deny by Default' vs. 'Allow by Default' approach].
* **Implicit Rules:** [Briefly mention the default VPC rules and if you chose to override them for security].

### ### 2. Identity-Based Microsegmentation
* **Service Accounts vs. Network Tags:** [Explain which one you used. *Pro-Tip: Mentioning Service Accounts for firewalling is considered higher-grade security than tags.*]
* **IAP Integration:** [Explain how you used the IP range `35.235.240.0/20` to allow secure SSH without external IPs].

### ### 3. Monitoring & Auditing
* **Firewall Insights:** [Mention if you reviewed which rules are being hit].
* **Logging:** [State if you enabled Firewall Flow Logs for auditing and why it's critical for the SEIR role].

---

## ## Implementation Workflow

### ### Command Line Execution
```bash
# Example: Creating a rule to allow IAP (Identity Aware Proxy)
gcloud compute firewall-rules create allow-ssh-ingress-from-iap \
    --network=[VPC_NAME] \
    --action=ALLOW \
    --direction=INGRESS \
    --source-ranges=35.235.240.0/20 \
    --rules=tcp:22
```

### ### Configuration Highlights
* **Step 1:** Cleaned up default "allow-everything" rules created by GCP.
* **Step 2:** Grouped instances by [Tags/Service Accounts] to apply logic-based rules.
* **Step 3:** Implemented Hierarchical Firewall Policies (if applicable).

---

## ## Validation & Testing
*How did you verify the perimeter was secure?*

* **Success Scenario:** [e.g., "Verified that the Web Load Balancer can reach the instances on Port 80."]
* **Failure Scenario (The 'Negative Test'):** [e.g., "Attempted to SSH from a public IP not in the allow-list; connection was dropped as expected."]
* **Audit Trail:**
    > [Optional: Include a screenshot of the 'Firewall Logs' showing a 'DENY' action for unauthorized traffic.]

---

## ## Engineering Reflection
* **Lessons Learned:** [e.g., "Learned that firewall rules are stateful, so I only need to define ingress for a bidirectional conversation."]
* **Production Recommendation:** [e.g., "For a production environment, I recommend using Hierarchical Firewall Policies to enforce security at the Folder or Organization level to prevent developers from accidentally bypassing security."]

---

### **Vocabulary for Job Readiness:**
* **Stateful:** Explain that response traffic is automatically allowed.
* **Ingress/Egress:** Use these instead of "inbound/outbound."
* **Micro-segmentation:** The practice of isolating workloads from each other within the same network.
* **Least Privilege:** Giving only the minimum access required for a service to function.
