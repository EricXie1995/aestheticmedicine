package com.iiiedu.beauty.forum.util;

import java.beans.PropertyDescriptor;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

/**
 * 更新工具類(忽略為null的字段)
 */
public class UpdateUtil {
 
  /**
   * 所有為空值的屬性都不copy
   * 
   * @param source
   * @param target
   */
  public static void copyNullProperties(Object source, Object target) {
    BeanUtils.copyProperties(source, target, getNullField(source));
  }
 
  /**
   * 獲取屬性中為空的字段
   * 
   * @param target
   * @return
   */
  private static String[] getNullField(Object target) {
    BeanWrapper beanWrapper = new BeanWrapperImpl(target);
    PropertyDescriptor[] propertyDescriptors = beanWrapper.getPropertyDescriptors();
    Set<String> notNullFieldSet = new HashSet<>();
    if (propertyDescriptors.length > 0) {
      for (PropertyDescriptor p : propertyDescriptors) {
        String name = p.getName();
        Object value = beanWrapper.getPropertyValue(name);
        if (Objects.isNull(value)) {
          notNullFieldSet.add(name);
        }
      }
    }
    String[] notNullField = new String[notNullFieldSet.size()];
    return notNullFieldSet.toArray(notNullField);
  }
}

