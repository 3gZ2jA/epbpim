package com.ryxx.bpim.dao;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.ryxx.bpim.entity.GuideData;

/**
 * author Delgado
 */
public class GuideDataDAOImpl extends AbstractBaseDAO<GuideData, Long> implements GuideDataDAO
{
    @Override
    public void saveGuideData(GuideData guideData)
    {
        save(guideData);
    }
    
    @Override
    public void deleteGuideData(GuideData guideData)
    {
        remove(guideData);
    }
    
    @Override
    public List<GuideData> listGuideData(GuideData guideData)
    {
        return findPageByPage(guideData.getStartRow(), guideData.getPageSize(), wrapCriterion(guideData));
    }
    
    @Override
    public List<GuideData> getGuideData(GuideData guideData)
    {
        Criteria criteria = getSession().createCriteria(GuideData.class);
        
        if (guideData.getProvinceCity() != null && 0 != guideData.getProvinceCity().getId())
        {
            criteria.add(Restrictions.eq("provinceCity.id", guideData.getProvinceCity().getId()));
        }
        
        if (!StringUtils.isEmpty(guideData.getGuideDataType()))
        {
            String guideDataType = "";
            if ("1".equals(guideData.getGuideDataType()))
            {
                guideDataType = "市政";
            }
            //            else if ("2".equals(guideData.getGuideDataType()))
            //            {
            //                guideDataType = "园林";
            //            }
            else if ("3".equals(guideData.getGuideDataType()))
            {
                guideDataType = "土建";
            }
            else if ("4".equals(guideData.getGuideDataType()))
            {
                guideDataType = "公用";
            }
            else if ("5".equals(guideData.getGuideDataType()))
            {
                guideDataType = "水利";
            }
            else if ("6".equals(guideData.getGuideDataType()))
            {
                guideDataType = "人防";
            }
            else if ("7".equals(guideData.getGuideDataType()))
            {
                guideDataType = "房修";
            }
            criteria.add(Restrictions.eq("guideDataType", guideDataType));
        }
        
        if (!StringUtils.isEmpty(guideData.getGuideDataDatePage()))
        {
            try
            {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
                Date periodicalDate = sdf.parse(guideData.getGuideDataDatePage());
                criteria.add(Restrictions.eq("guideDataDate", new Timestamp(periodicalDate.getTime())));
            }
            catch (ParseException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
        return criteria.list();
    }
    
    @Override
    public int getRowCount(GuideData guideData)
    {
        return findByCriteria(wrapCriterion(guideData)).size();
        
    }
    
    private Criterion[] wrapCriterion(GuideData guideData)
    {
        List<Criterion> list = new ArrayList<Criterion>();
        if (guideData != null)
        {
            if (!StringUtils.isEmpty(guideData.getGuideDataType()))
            {
                String guideDataType = "";
                if ("1".equals(guideData.getGuideDataType()))
                {
                    guideDataType = "市政";
                }
                //            else if ("2".equals(guideData.getGuideDataType()))
                //            {
                //                guideDataType = "园林";
                //            }
                else if ("3".equals(guideData.getGuideDataType()))
                {
                    guideDataType = "土建";
                }
                else if ("4".equals(guideData.getGuideDataType()))
                {
                    guideDataType = "公用";
                }
                else if ("5".equals(guideData.getGuideDataType()))
                {
                    guideDataType = "水利";
                }
                else if ("6".equals(guideData.getGuideDataType()))
                {
                    guideDataType = "人防";
                }
                else if ("7".equals(guideData.getGuideDataType()))
                {
                    guideDataType = "房修";
                }
                
                Criterion criterion1 = Restrictions.eq("guideDataType", guideDataType);
                list.add(criterion1);
            }
            
            if (!StringUtils.isEmpty(guideData.getGuideDataClass()))
            {
                Criterion criterion2 = Restrictions.eq("guideDataClass", guideData.getGuideDataClass());
                list.add(criterion2);
            }
            
            if (!StringUtils.isEmpty(guideData.getNum()))
            {
                Criterion criterion3 = Restrictions.like("num", "%" + guideData.getNum() + "%");
                list.add(criterion3);
            }
            
            if (!StringUtils.isEmpty(guideData.getName()))
            {
                Criterion criterion4 = Restrictions.like("name", "%" + guideData.getName() + "%");
                list.add(criterion4);
            }
            
            if (!StringUtils.isEmpty(guideData.getUnit()))
            {
                Criterion criterion5 = Restrictions.like("unit", "%" + guideData.getUnit() + "%");
                list.add(criterion5);
            }
            
            if (guideData.getProvinceCity() != null && 0 != guideData.getProvinceCity().getId())
            {
                Criterion criterion6 = Restrictions.eq("provinceCity.id", guideData.getProvinceCity().getId());
                list.add(criterion6);
            }
            
            if (!StringUtils.isEmpty(guideData.getGuideDataDatePage()))
            {
                try
                {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
                    Date guideDataDate = sdf.parse(guideData.getGuideDataDatePage());
                    Criterion criterion7 = Restrictions.eq("guideDataDate", new Timestamp(guideDataDate.getTime()));
                    list.add(criterion7);
                }
                catch (ParseException e)
                {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        
        Criterion[] criterions = {};
        if (list != null && list.size() > 0)
        {
            criterions = new Criterion[list.size()];
            for (int i = 0; i < list.size(); i++)
            {
                criterions[i] = list.get(i);
            }
        }
        
        return criterions;
    }
    
}
