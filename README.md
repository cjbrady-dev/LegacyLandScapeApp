# LegacyLandScapeApp
## Design plan


# Equipment Maintenance App – Database Schema

---

## Users

- **id**
- **name**
- **email**
- **password** (hashed)
- **role** (admin / worker)

---

## Equipment

- **id**
- **name**
- **type** (mower, blower, trimmer, etc.)
- **serialNumber**
- **active** (true / false)

---

## MaintenanceTypes

- **id**
- **name** (Oil Change, Spark Plug, Filter Replacement, etc.)
- **description**

---

## MaintenanceSchedules

- **id**
- **equipmentId**
- **maintenanceTypeId**
- **frequencyType** (daily / weekly / customDays)
- **customDaysNumber**
- **assignedUserId**
- **lastCompletedDate**
- **nextDueDate**

---

## MaintenanceHistory

- **id**
- **scheduleId**
- **completedBy**
- **completedDate**
- **notes**