# SQL LeetCode Easy — Quick Toolkit (MySQL)



## 0. شكل الاستعلام الأساسي

```sql
SELECT column1, column2
FROM table_name
WHERE condition
GROUP BY column1
HAVING aggregate_condition
ORDER BY column1 ASC
LIMIT 10;
```

**الترتيب المنطقي التقريبي:** `FROM/JOIN` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `DISTINCT` → `ORDER BY` → `LIMIT`.

## 1. SELECT / DISTINCT / Aliases

```sql
SELECT name, salary FROM Employee;
SELECT DISTINCT department_id FROM Employee;
SELECT salary AS employee_salary FROM Employee;
```

- `SELECT *`: كل الأعمدة. حدّد الأعمدة المطلوبة عندما يكون ذلك مناسبًا.
- `DISTINCT`: إزالة الصفوف المكررة من النتيجة.
- `AS`: اسم مستعار للعمود أو الجدول؛ غالبًا يمكن الاستغناء عن كلمة `AS`.

## 2. WHERE — الفلترة

```sql
WHERE salary > 5000
WHERE salary BETWEEN 3000 AND 7000 -- الطرفان داخل النطاق
WHERE department_id IN (1, 2, 3)
WHERE name LIKE 'A%'               -- يبدأ بـ A
WHERE name LIKE '%son%'            -- يحتوي على son
WHERE age IS NULL
WHERE age IS NOT NULL
WHERE salary > 5000 AND department_id = 3
WHERE department_id = 3 OR department_id = 4
```

- المقارنة: `=`, `<>` أو `!=`, `>`, `>=`, `<`, `<=`
- المنطق: `AND`, `OR`, `NOT`
- المجموعة والنطاق: `IN`, `BETWEEN`
- `LIKE`: `%` أي عدد من الحروف، و`_` حرف واحد.
- مع `NULL`: استخدم `IS NULL` وليس `= NULL`.

## 3. CASE — شروط داخل SELECT

```sql
SELECT name,
       CASE
           WHEN salary >= 10000 THEN 'High'
           WHEN salary >= 5000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_level
FROM Employee;
```

`CASE WHEN ... THEN ... ELSE ... END` شبيهة بـ if/else.

## 4. JOIN — ربط الجداول

### INNER JOIN
يعرض الصفوف التي لها تطابق في الجدولين.

```sql
SELECT e.name, d.department_name
FROM Employee e
INNER JOIN Department d ON e.department_id = d.id;
```

### LEFT JOIN
يعرض كل صفوف الجدول اليسار، حتى لو مفيش تطابق؛ أعمدة الجدول اليمين تكون `NULL`.

```sql
SELECT s.student_name, COUNT(e.course_id) AS course_count
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;
```

**مهم:** مع `LEFT JOIN` استخدم `COUNT(e.course_id)` لو عايز 0 للصفوف بدون تطابق. `COUNT(*)` قد يعدّ صف الـ NULL الممتد ويعطي 1.

### SELF JOIN
نفس الجدول مرتين بأسماء مستعارة مختلفة، مثل الموظف ومديره.

```sql
SELECT e.name AS Employee
FROM Employee e
INNER JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;
```

- `e`: الموظف، `m`: المدير.
- `INNER JOIN` لو المطلوب يحتاج تطابقًا.
- `LEFT JOIN` لو لازم تحتفظ بكل صفوف الجدول اليسار حتى بدون تطابق.

### ON vs WHERE مع LEFT JOIN
- `ON` يحدد شروط المطابقة.
- لو عايز تحتفظ بكل صفوف الجدول اليسار وتقيّد مطابقة الجدول اليمين، ضع شرط الجدول اليمين في `ON`.
- وضع شرط على عمود الجدول اليمين في `WHERE` قد يستبعد الصفوف غير المتطابقة.

## 5. Aggregate Functions — التجميع

```sql
SELECT department_id,
       COUNT(*) AS row_count,
       COUNT(salary) AS known_salary_count,
       COUNT(DISTINCT employee_id) AS unique_employees,
       SUM(salary) AS total_salary,
       AVG(salary) AS avg_salary,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id;
```

- `COUNT(*)`: يعدّ الصفوف.
- `COUNT(column)`: يعدّ القيم غير الـ `NULL` في العمود.
- `COUNT(DISTINCT column)`: يعدّ القيم المختلفة غير الـ `NULL`.
- `SUM`, `AVG`, `MIN`, `MAX`: تتجاهل `NULL` عادةً.
- `GROUP BY`: يجمع الصفوف حسب قيمة أو مجموعة قيم.
- `WHERE`: يفلتر الصفوف قبل التجميع.
- `HAVING`: يفلتر المجموعات بعد التجميع.

```sql
SELECT department_id, COUNT(*) AS total
FROM Employee
WHERE salary > 3000
GROUP BY department_id
HAVING COUNT(*) >= 2;
```

## 6. Subqueries — الاستعلامات الفرعية

### Scalar Subquery — قيمة واحدة
```sql
SELECT name, salary
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);
```

### IN — القيمة ضمن مجموعة
```sql
SELECT s.student_name
FROM students s
WHERE s.student_id IN (
    SELECT e.student_id
    FROM enrollments e
    WHERE e.course_id = 5
);
```

### NOT IN — ليست ضمن مجموعة
```sql
SELECT s.student_name
FROM students s
WHERE s.student_id NOT IN (
    SELECT e.student_id
    FROM enrollments e
    WHERE e.course_id = 5
);
```
**تحذير:** لو الـ subquery ممكن ترجع `NULL`، فإن `NOT IN` قد لا تعطي النتيجة المتوقعة. تأكد أن العمود غير قابل لـ `NULL` أو استخدم `NOT EXISTS`.

### EXISTS / NOT EXISTS
```sql
-- له تسجيل في المادة 5
SELECT s.student_name
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM enrollments e
    WHERE e.student_id = s.student_id AND e.course_id = 5
);

-- ليس له تسجيل في المادة 5
SELECT s.student_name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM enrollments e
    WHERE e.student_id = s.student_id AND e.course_id = 5
);
```

- `EXISTS`: هل يوجد صف واحد على الأقل يطابق الشروط؟
- `SELECT 1` قيمة شكلية؛ `EXISTS` يهتم بوجود الصفوف لا بالقيمة المرجعة.
- `EXISTS` لا يحسب عدد الصفوف ولا يكرر صف الطالب بسبب تعدد المطابقات.
- لو الاستعلام الداخلي يعتمد على صف خارجي مثل `s.student_id`، فهو **correlated subquery**.

## 7. NULL — أهم الفخاخ

- `NULL` ليست صفرًا وليست نصًا فارغًا.
- استخدم `IS NULL` / `IS NOT NULL`، وليس `= NULL`.
- `COUNT(column)` يتجاهل `NULL`; `COUNT(*)` يعدّ الصف.
- في `LEFT JOIN`، الصف غير المتطابق يعطي `NULL` في أعمدة الجدول اليمين.
- `NOT IN` مع `NULL` داخل مجموعة النتائج قد يمنع ظهور الصفوف المتوقعة.
- المقارنات العادية مع `NULL` لا تعطي `TRUE`؛ النتيجة غالبًا `UNKNOWN`.

## 8. DELETE / TRUNCATE / DROP

```sql
DELETE FROM Employee WHERE id = 10;
```

- `DELETE`: يحذف صفوفًا؛ يمكن تحديدها بـ `WHERE`. من غير `WHERE` يحذف كل الصفوف.
- `TRUNCATE TABLE Employee`: يحذف كل الصفوف ويحافظ على هيكل الجدول؛ لا يقبل `WHERE`.
- `DROP TABLE Employee`: يحذف الجدول نفسه مع هيكله وبياناته.
- انتبه: `TRUNCATE` و`DROP` أوامر مدمرة؛ لا تستخدمها على بيانات مهمة.

## 9. ORDER BY / LIMIT

```sql
ORDER BY salary DESC, name ASC
LIMIT 10;
```

- `ASC`: تصاعدي (الافتراضي).
- `DESC`: تنازلي.
- العمود الثاني يكسر التعادل في الأول.
- `LIMIT` صيغة MySQL؛ في Oracle غالبًا تستخدم `FETCH FIRST n ROWS ONLY`.

## 10. Functions شائعة

```sql
LOWER(name)
UPPER(name)
LENGTH(name)
SUBSTRING(name, 1, 3)
CONCAT(first_name, ' ', last_name)
ROUND(salary, 2)
ABS(value)
MOD(value, 2)
COALESCE(commission, 0)
```

- `LOWER` / `UPPER`: تغيير حالة الأحرف.
- `LENGTH`: طول النص بالبايت في MySQL؛ `CHAR_LENGTH` يعدّ الأحرف.
- `SUBSTRING(text, start, length)`: اقتطاع جزء من النص؛ في MySQL البداية 1.
- `CONCAT`: دمج نصوص.
- `ROUND`: تقريب؛ `ABS`: القيمة المطلقة؛ `MOD`: باقي القسمة.
- `COALESCE(a, b, ...)`: أول قيمة ليست `NULL`.

### Date functions (MySQL)
```sql
SELECT DATE_ADD(order_date, INTERVAL 7 DAY) FROM Orders;
SELECT DATEDIFF(end_date, start_date) FROM Orders;
```
- `DATE_ADD`: إضافة مدة لتاريخ.
- `DATEDIFF(a, b)`: فرق الأيام بين التاريخين (a ناقص b في MySQL).
- دوال التاريخ تختلف بين MySQL وOracle؛ راجع dialect المسألة.

## 11. أنماط متكررة في LeetCode

### اكتشاف القيم المكررة
```sql
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
```

### أحدث/أقدم تاريخ لكل مجموعة
```sql
SELECT customer_id, MAX(order_date) AS latest_order
FROM Orders
GROUP BY customer_id;
```

### مقارنة الموظف بمديره — SELF JOIN
```sql
SELECT e.name AS Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;
```

### صفوف ليس لها تطابق — LEFT JOIN
```sql
SELECT a.id
FROM A a
LEFT JOIN B b ON b.a_id = a.id
WHERE b.a_id IS NULL;
```

### التحقق من وجود صف — EXISTS
```sql
SELECT a.id
FROM A a
WHERE EXISTS (
    SELECT 1 FROM B b WHERE b.a_id = a.id
);
```

## 12. Checklist قبل Submit

- [ ] هل اخترت الجداول والأعمدة الصحيحة؟
- [ ] هل شرط `ON` صحيح؟
- [ ] هل أحتاج `INNER JOIN` أم `LEFT JOIN`؟
- [ ] هل الشرط مكانه `WHERE` أم `HAVING`؟
- [ ] هل أحتاج `GROUP BY`؟
- [ ] هل أستخدم `COUNT(*)` أم `COUNT(column)` أم `COUNT(DISTINCT column)`؟
- [ ] هل يمكن وجود `NULL`؟
- [ ] هل يمكن أن تنتج صفوف مكررة؟
- [ ] هل المسألة تطلب ترتيبًا فعلًا؟
- [ ] هل أستخدم MySQL أم Oracle syntax؟

## 13. Interview English — جمل قصيرة

- **INNER JOIN vs LEFT JOIN:** “INNER JOIN returns only matching rows. LEFT JOIN returns all rows from the left table, including rows without a match.”
- **WHERE vs HAVING:** “WHERE filters rows before grouping, while HAVING filters groups after grouping.”
- **COUNT(*) vs COUNT(column):** “COUNT(*) counts rows. COUNT(column) counts non-NULL values.”
- **Primary Key vs Foreign Key:** “A primary key uniquely identifies each row. A foreign key links related tables.”
- **EXISTS:** “EXISTS checks whether at least one matching row exists.”
- **DELETE vs TRUNCATE vs DROP:** “DELETE removes rows, TRUNCATE removes all rows but keeps the table structure, and DROP removes the table itself.”

---

**نصيحة:** أثناء حل LeetCode Easy، حدّد النمط أولًا: filtering, join, aggregation, subquery, duplicate detection, or NULL handling. حاول تكتب الحل من ذاكرتك قبل الرجوع للورقة.
