package com.ryxx.bpim.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.ryxx.bpim.dao.GuidePriceDAO;
import com.ryxx.bpim.entity.GuidePrice;
import com.ryxx.util.page.PageTools;

/**
 * author Delgado
 */
public class GuidePriceServiceImpl extends AbstractService<GuidePrice, GuidePriceDAO, Long> implements
    GuidePriceService
{
    public String saveGuidePrice(GuidePrice guidePrice, File uploadfile)
        throws ParseException, SQLException, IOException
    {
        List<GuidePrice> guidePriceList = parseGuidePriceFile(uploadfile, guidePrice);
        
        for (GuidePrice guidePricee : guidePriceList)
        {
            getDao().saveGuidePrice(guidePricee);
        }
        
        return "true";
    }
    
    public String deleteGuidePrice(GuidePrice guidePrice)
        throws ParseException, SQLException
    {
        
        List<GuidePrice> preDelGuidePrice = getDao().getGuidePrice(guidePrice);
        
        for (GuidePrice guidePricee : preDelGuidePrice)
        {
            getDao().deleteGuidePrice(guidePricee);
        }
        return "true";
    }
    
    public List<GuidePrice> listGuidePrice(GuidePrice condition, PageTools page)
        throws SQLException
    {
        if (page != null)
        {
            if (page.getRecordCount() == 0)
            {
                int count = getDao().getRowCount(condition);
                page.setRecordCount(count);
            }
            condition.setStartRow(page.getPageStartRow());
            condition.setPageSize(page.getPageSize());
        }
        return getDao().listGuidePrice(condition);
    }
    
    /*
     * 解析信息价文件
     */
    private List<GuidePrice> parseGuidePriceFile(File uploadfile, GuidePrice guidePrice)
        throws IOException, ParseException
    {
        
        List<GuidePrice> resultList = new ArrayList<GuidePrice>();
        
        Sheet[] allSheet = getWb(uploadfile, guidePrice.getGuidePriceFileName());
        
        Row row = null;
        Timestamp uploadDate = new Timestamp(new Date().getTime());
        
        for (Sheet sheet : allSheet)
        {
            
            if (!"名称与规格".equals(getValue(sheet.getRow(0).getCell(0))))
            {
                continue;
            }
            
            int countRow = sheet.getLastRowNum();
            for (int i = 1; i <= countRow; i++)
            {
                row = sheet.getRow(i);
                GuidePrice data = new GuidePrice();
                data.setName(getValue(row.getCell(0)));
                data.setUnit(getValue(row.getCell(1)));
                data.setComment(getValue(row.getCell(2)));
                data.setPrice(Double.valueOf(getValue(row.getCell(3))));
                data.setPriceComment(getValue(row.getCell(4)));
                data.setGuidePriceClass(sheet.getSheetName());
                data.setGuidePriceType(guidePrice.getGuidePriceType());
                data.setGuidePriceDate(guidePrice.getGuidePriceDate());
                data.setUploadDate(uploadDate);
                data.setProvinceCity(guidePrice.getProvinceCity());
                resultList.add(data);
            }
        }
        
        return resultList;
    }
    
    /**
     * @param cell
     * @return
     */
    private String getValue(Cell cell)
    {
        if (isBlank(cell))
        {
            return "";
        }
        if (isString(cell))
        {
            return cell.getStringCellValue();
        }
        if (isNumber(cell))
        {
            return String.valueOf(cell.getNumericCellValue());
        }
        return null;
    }
    
    private static final int version2003 = 2003;
    
    private static final int version2007 = 2007;
    
    private static int version = version2003;
    
    private Sheet[] getWb(File file, String fileName)
        throws IOException
    {
        Workbook wb = null;
        if (fileName.endsWith("xls"))
            version = version2003;
        else if (fileName.endsWith("xlsx"))
            version = version2007;
        InputStream stream = null;
        if (version == version2003)
        {
            stream = new FileInputStream(file);
            wb = (Workbook)new HSSFWorkbook(stream);
        }
        else if (version == version2007)
        {
            wb = (Workbook)new XSSFWorkbook(file.getAbsolutePath());
        }
        
        Sheet[] allSheet = new Sheet[wb.getNumberOfSheets()];
        for (int i = 0; i < wb.getNumberOfSheets(); i++)
        {
            allSheet[i] = wb.getSheetAt(i);
        }
        
        return allSheet;
    }
    
    private Boolean isBlank(Cell cell)
    {
        return cell.getCellType() == Cell.CELL_TYPE_BLANK;
    }
    
    private Boolean isString(Cell cell)
    {
        return cell.getCellType() == Cell.CELL_TYPE_STRING;
    }
    
    private Boolean isNumber(Cell cell)
    {
        return cell.getCellType() == Cell.CELL_TYPE_NUMERIC;
    }
}
