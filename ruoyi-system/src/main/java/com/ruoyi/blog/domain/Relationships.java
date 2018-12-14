package com.ruoyi.blog.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.base.BaseEntity;

/**
 * 内容与项目关系表 blog_relationships
 * 
 * @author lw
 * @date 2018-12-14
 */
public class Relationships extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 内容主键 */
	private Integer cid;
	/** 项目主键 */
	private Integer mid;

	public void setCid(Integer cid) 
	{
		this.cid = cid;
	}

	public Integer getCid() 
	{
		return cid;
	}
	public void setMid(Integer mid) 
	{
		this.mid = mid;
	}

	public Integer getMid() 
	{
		return mid;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("cid", getCid())
            .append("mid", getMid())
            .toString();
    }
}
