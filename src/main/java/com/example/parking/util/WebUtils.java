package com.example.parking.util;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class WebUtils {
    public static void copyParamToBean(Map map, Object bean){
        try {
            BeanUtils.populate(bean,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    public static int transformSexIntoInt(String sex){
        if(sex.equals("男")){
            return 1;
        }
        return 0;
    }
}
