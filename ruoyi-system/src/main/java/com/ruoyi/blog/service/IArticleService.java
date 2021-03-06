package com.ruoyi.blog.service;

import com.ruoyi.blog.domain.Article;
import java.util.List;

/**
 * 文章 服务层
 * 
 * @author ruoyi
 * @date 2018-12-14
 */
public interface IArticleService 
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
     * 删除文章信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteArticleByIds(String ids);
	
}
