
--  IT Job Trends & Scope Analysis Database
--  Compatible with: SQLite 3.35+

--  TABLE 1: it_domains

CREATE TABLE IF NOT EXISTS it_domains (
    domain_id          INTEGER PRIMARY KEY,
    domain_name        TEXT NOT NULL,
    trending_score     INTEGER CHECK (trending_score BETWEEN 1 AND 10),
    avg_salary_usd     INTEGER,
    job_openings_k     INTEGER,
    yoy_growth_pct     REAL,
    top_skills         TEXT,
    demand_level       TEXT,
    future_outlook     TEXT
);

INSERT INTO it_domains (domain_name, trending_score, avg_salary_usd, job_openings_k, yoy_growth_pct, top_skills, demand_level, future_outlook) VALUES
('Artificial Intelligence / ML',   10, 135000, 420,  45.0, 'Python, TensorFlow, PyTorch, LLMs',           'Very High',  'Explosive Growth'),
('Cloud Computing',                10, 125000, 650,  38.0, 'AWS, Azure, GCP, Terraform, Kubernetes',       'Very High',  'Explosive Growth'),
('Cybersecurity',                   9, 120000, 580,  35.0, 'SIEM, Ethical Hacking, Zero Trust, Firewalls', 'Very High',  'Explosive Growth'),
('Data Engineering',                9, 118000, 390,  40.0, 'Spark, Kafka, dbt, Airflow, SQL',              'Very High',  'Explosive Growth'),
('Data Science & Analytics',        9, 115000, 370,  33.0, 'Python, R, SQL, Power BI, Tableau',            'Very High',  'Strong Growth'),
('DevOps / Platform Engineering',   9, 122000, 430,  37.0, 'Docker, Jenkins, GitLab, CI/CD, Ansible',      'Very High',  'Strong Growth'),
('Blockchain / Web3',               7, 105000, 110,  18.0, 'Solidity, Ethereum, Smart Contracts, DeFi',    'Medium',     'Moderate Growth'),
('Full Stack Development',          8, 108000, 720,  25.0, 'React, Node.js, TypeScript, REST APIs',         'High',       'Strong Growth'),
('Mobile Development',              8, 105000, 310,  22.0, 'Swift, Kotlin, Flutter, React Native',          'High',       'Strong Growth'),
('AR / VR / Metaverse',             6,  98000,  85,  20.0, 'Unity, Unreal Engine, OpenXR, 3D Modelling',   'Medium',     'Moderate Growth'),
('IoT Engineering',                 7, 100000, 140,  24.0, 'MQTT, Embedded C, AWS IoT, Edge Computing',    'Medium-High','Strong Growth'),
('Quantum Computing',               6, 130000,  25,  30.0, 'Qiskit, Q#, Linear Algebra, Quantum Theory',   'Low/Emerging','Emerging'),
('Database Administration',         7,  95000, 200,  12.0, 'PostgreSQL, MongoDB, Oracle, Redis, MySQL',    'Medium',     'Stable'),
('UI/UX Design',                    7,  95000, 260,  18.0, 'Figma, Adobe XD, User Research, Prototyping',  'Medium-High','Strong Growth'),
('IT Project Management',           7, 105000, 300,  15.0, 'PMP, Agile, Scrum, JIRA, Confluence',          'Medium-High','Stable'),
('Network Engineering',             7,  98000, 220,  10.0, 'Cisco, SD-WAN, BGP, Wireshark, OSPF',          'Medium',     'Stable'),
('Robotics & Automation',           7, 102000,  95,  28.0, 'ROS, Python, Computer Vision, C++',            'Medium-High','Strong Growth'),
('ERP / SAP Consulting',            6, 108000, 180,   8.0, 'SAP S/4HANA, Finance, Logistics, ABAP',        'Medium',     'Stable'),
('Low-Code / No-Code Development',  6,  85000, 150,  20.0, 'Power Platform, OutSystems, Appian, Mendix',   'Medium',     'Moderate Growth'),
('Game Development',                5,  88000,  70,  10.0, 'Unity, Unreal, C++, Graphics APIs, HLSL',      'Low-Medium', 'Stable');

--  TABLE 2: salary_levels

CREATE TABLE IF NOT EXISTS salary_levels (
    salary_id         INTEGER PRIMARY KEY,
    domain_id         INTEGER,
    domain_name       TEXT,
    entry_level_usd   INTEGER,
    mid_level_usd     INTEGER,
    senior_level_usd  INTEGER,
    lead_manager_usd  INTEGER,
    FOREIGN KEY (domain_id) REFERENCES it_domains(domain_id)
);

INSERT INTO salary_levels (domain_id, domain_name, entry_level_usd, mid_level_usd, senior_level_usd, lead_manager_usd) VALUES
(1,  'Artificial Intelligence / ML',  75000, 110000, 155000, 185000),
(2,  'Cloud Computing',               70000, 105000, 145000, 175000),
(3,  'Cybersecurity',                 68000, 100000, 140000, 170000),
(4,  'Data Engineering',              72000, 108000, 140000, 168000),
(5,  'Data Science & Analytics',      70000, 105000, 138000, 165000),
(6,  'DevOps / Platform Engineering', 72000, 108000, 145000, 172000),
(7,  'Blockchain / Web3',             65000,  98000, 135000, 158000),
(8,  'Full Stack Development',        65000,  95000, 128000, 155000),
(9,  'Mobile Development',            63000,  92000, 125000, 150000),
(10, 'AR / VR / Metaverse',           60000,  88000, 120000, 145000),
(11, 'IoT Engineering',               62000,  88000, 118000, 142000),
(12, 'Quantum Computing',             80000, 115000, 160000, 195000),
(13, 'Database Administration',       58000,  82000, 112000, 132000),
(14, 'UI/UX Design',                  55000,  80000, 110000, 130000),
(15, 'IT Project Management',         60000,  88000, 118000, 145000);


--  TABLE3 : skills_certifications

CREATE TABLE IF NOT EXISTS skills_certifications (
    skill_id             INTEGER PRIMARY KEY,
    domain_id            INTEGER,
    domain_name          TEXT,
    must_have_skills     TEXT,
    top_certifications   TEXT,
    difficulty_level     TEXT,
    time_to_job_ready    TEXT,
    FOREIGN KEY (domain_id) REFERENCES it_domains(domain_id)
);

INSERT INTO skills_certifications (domain_id, domain_name, must_have_skills, top_certifications, difficulty_level, time_to_job_ready) VALUES
(1,  'AI / ML',                  'Python, ML Algorithms, Deep Learning, NLP, Statistics',    'Google ML Cert, AWS ML Specialty, TF Developer',     'High',    '12-18 months'),
(2,  'Cloud Computing',          'AWS/Azure/GCP, Terraform, Kubernetes, Linux, Networking',  'AWS SAA, AZ-900/104, GCP ACE, CKA',                  'Medium',  '6-12 months'),
(3,  'Cybersecurity',            'Networking, Linux, SIEM, Pen Testing, Risk Assessment',    'CISSP, CEH, CompTIA Security+, OSCP',                 'High',    '12-24 months'),
(4,  'Data Engineering',         'SQL, Python, Spark, Kafka, dbt, Airflow, Data Pipelines', 'Google Data Eng., Databricks, dbt Cert.',             'Medium',  '8-14 months'),
(5,  'Data Science & Analytics', 'Python/R, Statistics, Machine Learning, Tableau, Power BI','IBM Data Science, Google Data Analytics, DP-900',    'Medium',  '9-15 months'),
(6,  'DevOps',                   'Docker, CI/CD, Git, Linux, Ansible, Infrastructure Code', 'CKA, AWS DevOps, AZ DevOps, Jenkins Cert.',           'Medium',  '6-12 months'),
(7,  'Full Stack Development',   'React/Vue, Node.js, REST APIs, Databases, Git',            'Meta Frontend, freeCodeCamp, Microsoft Cert.',        'Medium',  '8-14 months'),
(8,  'Mobile Development',       'Swift or Kotlin, Flutter, APIs, Git, UX basics',           'Google Associate Android, Apple WWDC Cert.',          'Medium',  '6-12 months'),
(9,  'Blockchain',               'Solidity, Web3.js, Smart Contracts, DeFi, Cryptography',  'Ethereum Developer, ConsenSys Bootcamp',              'High',    '10-16 months'),
(10, 'IoT Engineering',          'Embedded C, MQTT, Python, Edge Computing, Protocols',      'AWS IoT, Google IoT Cert., Cisco IoT',                'Medium',  '8-14 months'),
(11, 'Quantum Computing',        'Qiskit, Q#, Linear Algebra, Quantum Mechanics, Python',    'IBM Quantum Developer, Microsoft Azure Quantum',      'Very High','18-24 months'),
(12, 'UI/UX Design',             'Figma, User Research, Prototyping, Wireframing, CSS',      'Google UX Design Cert., Nielsen Norman NN/g',         'Low-Med',  '4-8 months');

--  ANALYTICAL QUERIES

-- Top 5 trending IT domains
SELECT domain_name, trending_score, demand_level, future_outlook
FROM it_domains
ORDER BY trending_score DESC, yoy_growth_pct DESC
LIMIT 5;

-- Domains sorted by YoY growth %
SELECT domain_name, yoy_growth_pct, job_openings_k, demand_level
FROM it_domains
ORDER BY yoy_growth_pct DESC;

-- Average salary across all experience levels per domain
SELECT
    domain_name,
    entry_level_usd,
    mid_level_usd,
    senior_level_usd,
    lead_manager_usd,
    ROUND((entry_level_usd + mid_level_usd + senior_level_usd + lead_manager_usd) / 4) AS avg_all_levels
FROM salary_levels
ORDER BY avg_all_levels DESC;

-- High-demand domains with high salary and growth
SELECT domain_name, trending_score, avg_salary_usd, job_openings_k, yoy_growth_pct
FROM it_domains
WHERE trending_score >= 8
  AND avg_salary_usd >= 110000
  AND yoy_growth_pct >= 30
ORDER BY avg_salary_usd DESC;

-- Quick entry domains (easy to get job-ready)
SELECT domain_name, difficulty_level, time_to_job_ready, top_certifications
FROM skills_certifications
WHERE difficulty_level IN ('Low-Med', 'Medium')
ORDER BY difficulty_level;

-- Total global job openings
SELECT
    SUM(job_openings_k) AS total_jobs_thousands,
    SUM(job_openings_k) * 1000 AS total_jobs_absolute
FROM it_domains;

-- Domains grouped by demand level
SELECT demand_level,
       COUNT(*) AS domain_count,
       ROUND(AVG(avg_salary_usd)) AS avg_salary,
       ROUND(AVG(yoy_growth_pct), 1) AS avg_growth_pct
FROM it_domains
GROUP BY demand_level
ORDER BY avg_salary DESC;

-- Full joined view
SELECT
    d.domain_name,
    d.trending_score,
    d.avg_salary_usd,
    d.yoy_growth_pct,
    d.demand_level,
    s.entry_level_usd,
    s.senior_level_usd,
    sc.difficulty_level,
    sc.time_to_job_ready
FROM it_domains d
LEFT JOIN salary_levels s  ON d.domain_id = s.domain_id
LEFT JOIN skills_certifications sc ON d.domain_id = sc.domain_id
ORDER BY d.trending_score DESC, d.yoy_growth_pct DESC;
