This is a **fully legitimate minimum viable AWS service** for a private server. ✅

## 1️⃣ VPC

- Acts as the **network container** for all resources.
- You have full control over the IP range (`10.0.0.0/16`).
- **No dependencies yet**, so Terraform can create it first.

---

## 2️⃣ Subnet

- Mandatory for EC2. AWS **does not allow EC2 outside a subnet**.
- `10.0.1.0/24` is a private subnet inside your VPC.
- Minimal setup: no Internet Gateway, so it’s fully isolated.

---

## 3️⃣ Security Group

- EC2 **cannot run safely without a firewall**.
- Ingress allows only SSH from inside the VPC (`10.0.0.0/16`).
- Egress allows everything out (optional but standard).
- This gives you a **true private firewalled server**.

---

## 4️⃣ EC2 Instance

- The VM itself.
- Lives in your subnet.
- Uses your security group.
- No public IP → **fully private**.
- `t3.micro` is the smallest instance, good for learning.

---

## ✅ Why this is minimal but valid

1. **All dependencies exist** — Terraform can create in order.
2. **Everything is hardcoded** — good for first IaC project.
3. **Private server** — isolated, secure, and functional if you want to add a Bastion host later.
4. **Terraform-ready** — one file, one apply, everything managed.
