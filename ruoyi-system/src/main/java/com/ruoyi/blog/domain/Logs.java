package com.ruoyi.blog.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.base.BaseEntity;

/**
 * 博客日志表 blog_logs
 * 
 * @author lw
 * @date 2018-12-14
 */
public class Logs extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 主键 */
	private Integer id;
	/** 产生的动作 */
	private String action;
	/** 数据 */
	private String data;
	/** 用户id */
	private Integer authorId;
	/** ip */
	private String ip;
	/** 创建时间 */
	private Integer created;

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setAction(String action) 
	{
		this.action = action;
	}

	public String getAction() 
	{
		return action;
	}
	public void setData(String data) 
	{
		this.data = data;
	}

	public String getData() 
	{
		return data;
	}
	public void setAuthorId(Integer authorId) 
	{
		this.authorId = authorId;
	}

	public Integer getAuthorId() 
	{
		return authorId;
	}
	public void setIp(String ip) 
	{
		this.ip = ip;
	}

	public String getIp() 
	{
		return ip;
	}
	public void setCreated(Integer created) 
	{
		this.created = created;
	}

	public Integer getCreated() 
	{
		return created;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("action", getAction())
            .append("data", getData())
            .append("authorId", getAuthorId())
            .append("ip", getIp())
            .append("created", getCreated())
            .toString();
    }
}
