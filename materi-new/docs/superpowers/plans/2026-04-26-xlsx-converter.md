# XLSX to CSV Converter Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a script to convert xlsx files in xlsx/ to CSV files in csv/, preserving raw cell content including formulas.

**Architecture:** Node.js script using xlsx package with cellFormula option to read formulas as stored. Process each xlsx file, combine all sheets, output as semicolon-delimited CSV with ANSI encoding.

**Tech Stack:** Node.js, xlsx npm package

---

### Task 1: Create converter script

**Files:**
- Create: `scripts/convert.js`
- Test: `scripts/convert.test.js`

- [ ] **Step 1: Write test file**

```javascript
const fs = require('fs');
const path = require('path');

describe('convert.js', () => {
  const xlsxDir = path.join(__dirname, '..', 'xlsx');
  const csvDir = path.join(__dirname, '..', 'csv');
  
  beforeAll(() => {
    if (!fs.existsSync(csvDir)) {
      fs.mkdirSync(csvDir, { recursive: true });
    }
  });
  
  test('produces csv file from xlsx', () => {
    const converter = require('./convert');
    const xlsxFiles = fs.readdirSync(xlsxDir).filter(f => f.endsWith('.xlsx'));
    
    expect(xlsxFiles.length).toBeGreaterThan(0);
    
    for (const file of xlsxFiles) {
      const csvPath = converter.convert(file);
      expect(fs.existsSync(csvPath)).toBe(true);
      
      const content = fs.readFileSync(csvPath, 'utf-8');
      expect(content.startsWith('sep=;')).toBe(true);
    }
  });
  
  test('uses semicolon delimiter', () => {
    const converter = require('./convert');
    const csvPath = converter.convert('data_1.xlsx');
    const content = fs.readFileSync(csvPath, 'utf-8');
    const lines = content.split('\n');
    
    expect(lines[0].includes(';')).toBe(true);
  });
});
```

- [ ] **Step 2: Run test to verify it fails**

Run: `node scripts/convert.test.js` or `npx jest`
Expected: FAIL with "convert not defined"

- [ ] **Step 3: Write implementation**

```javascript
const fs = require('fs');
const path = require('path');
const XLSX = require('xlsx');

const XLSX_DIR = path.join(__dirname, '..', 'xlsx');
const CSV_DIR = path.join(__dirname, '..', 'csv');

function convertXlsx(filename) {
  const xlsxPath = path.join(XLSX_DIR, filename);
  const workbook = XLSX.readFile(xlsxPath, { cellFormula: true, cellNF: true });
  
  let allRows = [];
  const sheetNames = workbook.SheetNames;
  
  for (const sheetName of sheetNames) {
    const sheet = workbook.Sheets[sheetName];
    const data = XLSX.utils.sheet_to_json(sheet, { 
      header: 1,
      defval: '',
      raw: false
    });
    
    for (const row of data) {
      const processedRow = row.map(cell => {
        if (cell === null || cell === undefined || cell === '') {
          return '';
        }
        if (typeof cell === 'string' && cell.startsWith('=')) {
          return '=' + cell.substring(1);
        }
        return String(cell);
      });
      allRows.push(processedRow);
    }
  }
  
  const csvContent = allRows.map(row => {
    return row.join(';');
  }).join('\n');
  
  const csvFilename = filename.replace('.xlsx', '.csv');
  const csvPath = path.join(CSV_DIR, csvFilename);
  
  fs.writeFileSync(csvPath, csvContent, 'utf-8');
  
  return csvPath;
}

function processAll() {
  if (!fs.existsSync(CSV_DIR)) {
    fs.mkdirSync(CSV_DIR, { recursive: true });
  }
  
  const files = fs.readdirSync(XLSX_DIR).filter(f => f.endsWith('.xlsx'));
  
  const results = [];
  for (const file of files) {
    const csvPath = convertXlsx(file);
    results.push(csvPath);
    console.log(`Converted ${file} -> ${path.basename(csvPath)}`);
  }
  
  return results;
}

module.exports = { convert: convertXlsx, processAll };

if (require.main === module) {
  processAll();
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `node scripts/convert.test.js`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add scripts/convert.js scripts/convert.test.js
git commit -m "feat: add xlsx to csv converter script"
```

---

### Task 2: Verify array formula handling

**Files:**
- Test: `scripts/convert.test.js` (add tests)

- [ ] **Step 1: Add array formula test**

Add to test file:

```javascript
test('preserves array formula =@ prefix', () => {
  const content = fs.readFileSync(csvPath, 'utf-8');
  expect(content.includes('=@')).toBe(true);
});
```

- [ ] **Step 2: Run test**

Run: `node scripts/convert.test.js`
Expected: PASS (or adjust if needed)

- [ ] **Step 3: Commit**

```bash
git add scripts/convert.test.js
git commit -m "test: verify array formula preservation"
```