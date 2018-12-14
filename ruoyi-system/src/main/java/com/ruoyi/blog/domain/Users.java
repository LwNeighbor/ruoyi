package com.ruoyi.blog.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.base.BaseEntity;

/**
 * 用户表 blog_users
 * 
 * @author lw
 * @date 2018-12-14
 */
public class Users extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** ID */
	private Integer uid;
	/** 用户名称 */
	private String username;
	/** 用户密码 */
	private String password;
	/** 邮箱 */
	private String email;
	/** 用户主页 */
	private String homeUrl;
	/** 用户显示的名称 */
	private String screenName;
	/** 创建时间 */
	private Integer created;
	/** 最后活动时间 */
	private Integer activated;
	/** 上次登陆时间 */
	private Integer logged;
	/** 用户组 */
	private String groupName;

	public void setUid(Integer uid) 
	{
		this.uid = uid;
	}

	public Integer getUid() 
	{
		return uid;
	}
	public void setUsername(String username) 
	{
		this.username = username;
	}

	public String getUsername() 
	{
		return username;
	}
	public void setPassword(String password) 
	{
		this.password = password;
	}

	public String getPassword() 
	{
		return password;
	}
	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getEmail() 
	{
		return email;
	}
	public void setHomeUrl(String homeUrl) 
	{
		this.homeUrl = homeUrl;
	}

	public String getHomeUrl() 
	{
		return homeUrl;
	}
	public void setScreenName(String screenName) 
	{
		this.screenName = screenName;
	}

	public String getScreenName() 
	{
		return screenName;
	}
	public void setCreated(Integer created) 
	{
		this.created = created;
	}

	public Integer getCreated() 
	{
		return created;
	}
	public void setActivated(Integer activated) 
	{
		this.activated = activated;
	}

	public Integer getActivated() 
	{
		return activated;
	}
	public void setLogged(Integer logged) 
	{
		this.logged = logged;
	}

	public Integer getLogged() 
	{
		return logged;
	}
	public void setGroupName(String groupName) 
	{
		this.groupName = groupName;
	}

	public String getGroupName() 
	{
		return groupName;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("uid", getUid())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("email", getEmail())
            .append("homeUrl", getHomeUrl())
            .append("screenName", getScreenName())
            .append("created", getCreated())
            .append("activated", getActivated())
            .append("logged", getLogged())
            .append("groupName", getGroupName())
            .toString();
    }
}
