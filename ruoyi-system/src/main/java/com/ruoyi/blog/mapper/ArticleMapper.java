package com.ruoyi.blog.mapper;

import com.ruoyi.blog.domain.Article;
import java.util.List;	

/**
 * 文章 数据层
 * 
 * @author ruoyi
 * @date 2018-12-14
 */
public interface ArticleMapper 
{
	/**
     * 查询文章信息
     * 
     * @param cid 文章ID
     * @return 文章信息
     */
	public Article selectArticleById(Integer cid);
	
	/**
     * 查询文章列表
     * 
     * @param article 文章信息
     * @return 文章集合
     */
	public List<Article> selectArticleList(Article article);
	
	/**
     * 新增文章
     * 
     * @param article 文章信息
     * @return 结果
     */
	public int insertArticle(Article article);
	
	/**
     * 修改文章
     * 
     * @param article 文章信息
     * @return 结果
     */
	public int updateArticle(Article article);
	
	/**
     * 删除文章
     * 
     * @param cid 文章ID
     * @return 结果
     */
	public int deleteArticleById(Integer cid);
	
	/**
     * 批量删除文章
     * 
     * @param cids 需要删除的数据ID
     * @return 结果
     */
	public int deleteArticleByIds(String[] cids);
	
}