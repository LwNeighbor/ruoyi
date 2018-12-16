package com.ruoyi.blog.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.base.BaseEntity;

/**
 * 文章表 blog_article
 *
 * @author ruoyi
 * @date 2018-12-14
 */
public class Article extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Integer cid;
    /**
     * 内容标题
     */
    private String title;
    /**
     * 内容缩略名
     */
    private String slug;
    /**
     * 创建时间
     */
    private String created;
    /**
     * 修改时间
     */
    private String modified;
    /**
     * 内容文字
     */
    private String content;
    /**
     * 内容类别
     */
    private Integer authorId;
    /**
     * 内容类别
     */
    private String type;
    /**
     * 内容状态
     */
    private String status;
    /**
     * 标签列表
     */
    private String tags;
    /**
     * 分类列表
     */
    private String categories;
    /**
     * 点击次数
     */
    private Integer hits;
    /**
     * 内容所属评论数
     */
    private Integer commentsNum;
    /**
     * 是否允许评论
     */
    private Integer allowComment;
    /**
     * 是否允许ping
     */
    private Integer allowPing;
    /**
     * 允许出现在聚合中
     */
    private Integer allowFeed;

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getSlug() {
        return slug;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public String getCreated() {
        return created;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    public String getModified() {
        return modified;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getTags() {
        return tags;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    public String getCategories() {
        return categories;
    }

    public void setHits(Integer hits) {
        this.hits = hits;
    }

    public Integer getHits() {
        return hits;
    }

    public void setCommentsNum(Integer commentsNum) {
        this.commentsNum = commentsNum;
    }

    public Integer getCommentsNum() {
        return commentsNum;
    }

    public void setAllowComment(Integer allowComment) {
        this.allowComment = allowComment;
    }

    public Integer getAllowComment() {
        return allowComment;
    }

    public void setAllowPing(Integer allowPing) {
        this.allowPing = allowPing;
    }

    public Integer getAllowPing() {
        return allowPing;
    }

    public void setAllowFeed(Integer allowFeed) {
        this.allowFeed = allowFeed;
    }

    public Integer getAllowFeed() {
        return allowFeed;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("cid", getCid())
                .append("title", getTitle())
                .append("slug", getSlug())
                .append("created", getCreated())
                .append("modified", getModified())
                .append("content", getContent())
                .append("authorId", getAuthorId())
                .append("type", getType())
                .append("status", getStatus())
                .append("tags", getTags())
                .append("categories", getCategories())
                .append("hits", getHits())
                .append("commentsNum", getCommentsNum())
                .append("allowComment", getAllowComment())
                .append("allowPing", getAllowPing())
                .append("allowFeed", getAllowFeed())
                .toString();
    }
}
