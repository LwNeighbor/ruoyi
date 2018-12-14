package com.ruoyi.blog.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.base.BaseEntity;

/**
 * 配置表 blog_options
 * 
 * @author lw
 * @date 2018-12-14
 */
public class Options extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 配置名称 */
	private String name;
	/** 配置值 */
	private String value;
	/** 描述 */
	private String description;

	public void setName(String name) 
	{
		this.name = name;
	}

	public String getName() 
	{
		return name;
	}
	public void setValue(String value) 
	{
		this.value = value;
	}

	public String getValue() 
	{
		return value;
	}
	public void setDescription(String description) 
	{
		this.description = description;
	}

	public String getDescription() 
	{
		return description;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("name", getName())
            .append("value", getValue())
            .append("description", getDescription())
            .toString();
    }
}
