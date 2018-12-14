package com.ruoyi.blog.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.base.BaseEntity;

/**
 * 项目表 blog_metas
 * 
 * @author lw
 * @date 2018-12-14
 */
public class Metas extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 主键 */
	private Integer mid;
	/** 名称 */
	private String name;
	/** 项目缩略名 */
	private String slug;
	/** 项目类型 */
	private String type;
	/** 选项描述 */
	private String description;
	/** 项目排序 */
	private Integer sort;
	/** 父ID */
	private Integer parent;

	public void setMid(Integer mid) 
	{
		this.mid = mid;
	}

	public Integer getMid() 
	{
		return mid;
	}
	public void setName(String name) 
	{
		this.name = name;
	}

	public String getName() 
	{
		return name;
	}
	public void setSlug(String slug) 
	{
		this.slug = slug;
	}

	public String getSlug() 
	{
		return slug;
	}
	public void setType(String type) 
	{
		this.type = type;
	}

	public String getType() 
	{
		return type;
	}
	public void setDescription(String description) 
	{
		this.description = description;
	}

	public String getDescription() 
	{
		return description;
	}
	public void setSort(Integer sort) 
	{
		this.sort = sort;
	}

	public Integer getSort() 
	{
		return sort;
	}
	public void setParent(Integer parent) 
	{
		this.parent = parent;
	}

	public Integer getParent() 
	{
		return parent;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("mid", getMid())
            .append("name", getName())
            .append("slug", getSlug())
            .append("type", getType())
            .append("description", getDescription())
            .append("sort", getSort())
            .append("parent", getParent())
            .toString();
    }
}
