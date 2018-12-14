package com.ruoyi.blog.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.base.BaseEntity;

/**
 * 评论表 blog_comments
 * 
 * @author lw
 * @date 2018-12-14
 */
public class Comments extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 主键 */
	private Integer coid;
	/** 文章主键 */
	private Integer cid;
	/** 创建时间 */
	private Integer created;
	/** 评论用户 */
	private String author;
	/** 评论用户id */
	private Integer authorId;
	/** 内容作者id */
	private Integer ownerId;
	/** 评论者邮件 */
	private String mail;
	/** 评论者网址 */
	private String url;
	/** 评论者ip */
	private String ip;
	/** 评论者客户端 */
	private String agent;
	/** 评论内容 */
	private String content;
	/** 评论类型 */
	private String type;
	/** 评论状态 */
	private String status;
	/** 父级评论 */
	private Integer parent;

	public void setCoid(Integer coid) 
	{
		this.coid = coid;
	}

	public Integer getCoid() 
	{
		return coid;
	}
	public void setCid(Integer cid) 
	{
		this.cid = cid;
	}

	public Integer getCid() 
	{
		return cid;
	}
	public void setCreated(Integer created) 
	{
		this.created = created;
	}

	public Integer getCreated() 
	{
		return created;
	}
	public void setAuthor(String author) 
	{
		this.author = author;
	}

	public String getAuthor() 
	{
		return author;
	}
	public void setAuthorId(Integer authorId) 
	{
		this.authorId = authorId;
	}

	public Integer getAuthorId() 
	{
		return authorId;
	}
	public void setOwnerId(Integer ownerId) 
	{
		this.ownerId = ownerId;
	}

	public Integer getOwnerId() 
	{
		return ownerId;
	}
	public void setMail(String mail) 
	{
		this.mail = mail;
	}

	public String getMail() 
	{
		return mail;
	}
	public void setUrl(String url) 
	{
		this.url = url;
	}

	public String getUrl() 
	{
		return url;
	}
	public void setIp(String ip) 
	{
		this.ip = ip;
	}

	public String getIp() 
	{
		return ip;
	}
	public void setAgent(String agent) 
	{
		this.agent = agent;
	}

	public String getAgent() 
	{
		return agent;
	}
	public void setContent(String content) 
	{
		this.content = content;
	}

	public String getContent() 
	{
		return content;
	}
	public void setType(String type) 
	{
		this.type = type;
	}

	public String getType() 
	{
		return type;
	}
	public void setStatus(String status) 
	{
		this.status = status;
	}

	public String getStatus() 
	{
		return status;
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
            .append("coid", getCoid())
            .append("cid", getCid())
            .append("created", getCreated())
            .append("author", getAuthor())
            .append("authorId", getAuthorId())
            .append("ownerId", getOwnerId())
            .append("mail", getMail())
            .append("url", getUrl())
            .append("ip", getIp())
            .append("agent", getAgent())
            .append("content", getContent())
            .append("type", getType())
            .append("status", getStatus())
            .append("parent", getParent())
            .toString();
    }
}
