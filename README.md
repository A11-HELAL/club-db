# club-db — Sports Club Database

A relational database for a sports club, designed and built from scratch on **PostgreSQL 18**.

Every table, key and constraint here was decided on purpose — and I can explain why each one exists.

---

## 🗂️ The Schema — 7 tables

| Table | What it holds | Notes |
| --- | --- | --- |
| `member` | Club members | `email` is `UNIQUE` |
| `committee` | Committees inside the club | `chair_id` → one member, optional |
| `member_committee` | Member ↔ committee | Junction table, composite PK |
| `event` | Events organised by committees | `committee_id` is `NOT NULL` |
| `event_rsvp` | Who attends which event | Junction table, composite PK |
| `membership_fee` | Payments made by members | `amount` uses `NUMERIC(8,2)` |
| `equipment` | Gear, optionally assigned to an event | `event_id` is nullable on purpose |

### Relationships

```
member    1 ----< member_committee >---- 1  committee
member    1 ----< event_rsvp       >---- 1  event
member    1 ----< membership_fee
committee 1 ----< event 1 ----< equipment
```

---

## 🧠 Design decisions

- **`equipment.event_id` allows `NULL`** — a piece of equipment may sit in storage without belonging to any event. The foreign key prevents *orphan* rows (pointing at an event that does not exist), not *unassigned* rows.
- **Junction tables use a composite primary key** — the same member cannot RSVP twice to the same event.
- **Money is `NUMERIC(8,2)`, never `FLOAT`** — floating point rounding has no place in payments.
- **Every foreign key is named** (`CONSTRAINT fk_event_equipment ...`) — so error messages stay readable instead of `equipment_event_id_fkey`.

---

## ▶️ How to run it

```bash
createdb club_db
psql -d club_db -f 01_schema.sql
psql -d club_db -f 02_seed.sql
```

Or in **pgAdmin 4**: open the file in the Query Tool and press `F5`.

---

## 📁 Files

| File | Contents |
| --- | --- |
| `01_schema.sql` | All `CREATE TABLE` statements |
| `02_seed.sql` | Sample data for testing |
| `03_queries.sql` | Useful queries — coming soon |

---

## 📚 About

Built while working through relational database design: ERD → mapping → SQL.
The database grows one chapter at a time; nothing is added here before I understand it.

**Author:** [@A11-HELAL](https://github.com/A11-HELAL)
