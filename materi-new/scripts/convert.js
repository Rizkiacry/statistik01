const fs = require('fs');
const path = require('path');
const XLSX = require('xlsx');

const XLSX_DIR = path.join(__dirname, '..', 'xlsx');
const CSV_DIR = path.join(__dirname, '..', 'csv');

const UNICODE_TO_ASCII = {
  '∑': ' SUM ',
  'Σ': ' SIGMA ',
  'π': ' PI ',
  '≤': ' <= ',
  '≥': ' >= ',
  '≠': ' <> ',
  '√': ' SQRT ',
  '∞': ' INF ',
  'μ': ' MU ',
  'σ': ' SIGMA ',
  '°': ' DEG ',
  '±': ' +- ',
  '×': ' x ',
  '÷': ' / ',
  '→': ' -> ',
  '←': ' <- ',
  '↑': ' UP ',
  '↓': ' DOWN ',
};

function replaceUnicode(cellStr) {
  if (typeof cellStr !== 'string') return String(cellStr);
  let result = cellStr;
  for (const [unicode, ascii] of Object.entries(UNICODE_TO_ASCII)) {
    result = result.replace(new RegExp(unicode, 'g'), ascii);
  }
  return result;
}

function isArrayFormula(cell, formula) {
  if (cell.F) {
    return true;
  }
  const ARRAY_FORMULA_FUNCS = [
    'FREQUENCY', 'TRANSPOSE', 'LINEST', 'LOGEST', 'MINVERSE', 
    'MDETERM', 'SINGLE', 'CUBEROOT', 'CONCAT', 'TEXTJOIN',
    'FILTER', 'SORT', 'SORTBY', 'UNIQUE', 'RANDARRAY', 'SEQUENCE'
  ];
  const funcMatch = formula.match(/^(\w+)\(/i);
  if (funcMatch && ARRAY_FORMULA_FUNCS.includes(funcMatch[1].toUpperCase())) {
    return true;
  }
  return false;
}

function getCellValue(sheet, addr) {
  const cell = sheet[addr];
  if (!cell) return { value: '', isArray: false };
  
  if (cell.f !== undefined) {
    const isArr = isArrayFormula(cell, cell.f);
    return { value: '=' + cell.f, isArray: isArr };
  }
  
  if (cell.w !== undefined) {
    return { value: cell.w, isArray: false };
  }
  
  if (cell.v !== undefined) {
    return { value: cell.v, isArray: false };
  }
  
  return { value: '', isArray: false };
}

function convertXlsx(filename) {
  const xlsxPath = path.join(XLSX_DIR, filename);
  const workbook = XLSX.readFile(xlsxPath, { cellFormula: true, cellNF: true });
  
  let allRows = [];
  const sheetNames = workbook.SheetNames;
  
  for (const sheetName of sheetNames) {
    const sheet = workbook.Sheets[sheetName];
    const range = XLSX.utils.decode_range(sheet['!ref'] || 'A1');
    
    for (let r = range.s.r; r <= range.e.r; r++) {
      const row = [];
      for (let c = range.s.c; c <= range.e.c; c++) {
        const addr = XLSX.utils.encode_cell({ r, c });
        const { value, isArray } = getCellValue(sheet, addr);
        
        let cellStr = String(value === null || value === undefined ? '' : value);
        cellStr = replaceUnicode(cellStr);
        if (cellStr.startsWith('=') && isArray) {
          cellStr = '=@' + cellStr.substring(1);
        }
        row.push(cellStr);
      }
      allRows.push(row);
    }
  }
  
  const csvContent = 'sep=;\n' + allRows.map(row => row.join(';')).join('\n');
  
  const csvFilename = filename.replace('.xlsx', '.csv');
  const csvPath = path.join(CSV_DIR, csvFilename);
  
  fs.writeFileSync(csvPath, csvContent);
  
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